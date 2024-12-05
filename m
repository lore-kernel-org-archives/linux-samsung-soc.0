Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE308222584
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Dec 2024 17:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733421232; cv=none; b=C+nu4jfXRXzcNmCm0Didgx/UcvFtYA62zBt+gYh5q4aRwRISt1sL2iiS8yoaZWr2vbun/oj3dnnQVVyJojS8FyKqFKIkBI3tj6BMoFL1JF+AURJSDdmyBKfnT1/2deY7Ge0AF4d/ldJ0s/ZW6BknVWETtWyRYtBDblhVPHmsl3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733421232; c=relaxed/simple;
	bh=BjPBsTXSUJhOZ07W5tsbKN6EJfyDsDv5Mkm/n+Qnf7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kQsg6Vr9YX/GODo9EfRYpayExbqwW4Y7wPnd1UHh7nHULA15Vv3QVPK/my1IEVYbAhz6sR/k+X8ny9IjuKRqsgrG2cUegAlPu6Mwq6doYGFKtLCcLjfAhr8H6ugNUkQQj8V1eT+SpDUlzKu47MrIevZpIFZ47WOI9CtoRCHT0dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nWt3CZVl; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nWt3CZVl"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4349fb56260so8610545e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Dec 2024 09:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733421229; x=1734026029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PR2xJ5Z9SsCGNBcYWItEbZKibtJD439Z5G3+KUVhGYw=;
        b=nWt3CZVl1YtjAofaSKC8UUvj4W4CSZ5TBxSfH7rYefKpLvtF/xCJcptFyvUFPGHRR8
         Qujd1olIpAxyNlm9rNwq9mndcpltD0fZwea6IPPOZ2J446yiu/DtF2JzQCL5RNmSYI36
         fZ2Piaj4eoPzPXWxRXNPISnot+XaEWAYv8b1kKrLlXchGl2xs9GN5uYvnskQTLDQDEiZ
         3tz26rdQvgqagq0lodDthWh0N+ItkgSedF83W4dIR8YcZwmyqKfPZETCjrI8SotDRXDW
         Tr+9ehRDs4DZJL6zJ2ebJ5mxvAOS21PyP9qnA6tEhBVxbyBs8viE0hLHdQGVMEWEwhzt
         ZWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733421229; x=1734026029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PR2xJ5Z9SsCGNBcYWItEbZKibtJD439Z5G3+KUVhGYw=;
        b=j4hztEGzPXwM/f8kRJailcgBLWmTFKthFKEBkEFwIVt2OH82xmAuNyb4GM618bFoy0
         29HE1UI4zSazVyCUP8kHwY5R1uyYarg8Y50BdL/qiA/u/EIJbo5VXpaE69gsGZc/3O25
         fUBK2Agb786dIfZKIeBbPK/hE24L8z+FT9qaEseQGGPughE92zaa+b/XcXCVlDewCHnK
         YDX3IoiY/if3WMLp/ly+/WGeOV1KKpvFGwaoNcAE+q07TqZ5k41Mqibr+nsn4wk2kDEZ
         uLoGGH3w7BwppanffBXRPFUwyqAmTt9dMzx2p/fInr3te6xeIYY0th7I/nfDTwR56uy/
         e8ww==
X-Forwarded-Encrypted: i=1; AJvYcCVxvHGoefzmLgbQ++C5aLvkJH1v0eEPbCJdCBbYR0XoD6bsRMkZTaLbbyO1AS0mmbx6ynUnpYloHGCXg3984ttMNw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvk9XvGfDwqPcw5T7M+kszmAvg+n+IWoSahfKvDnJrDyJEQKiO
	SQgtlQ6z3wk/aWtoJWFeidt3BGFLf4fsnCTQg+20vAzOGl+ApmRjtMCVW4fEGUI=
X-Gm-Gg: ASbGnctUBta4810GwPXEiGTGZpH+RhG/2Fq7F8rlft5c2RLCYC3pnNLz061JaVWLLkF
	QpvJnmrwUolhZhl6IDq0uwcODBEwGrDeW6VkK3PrHzTwWG2MShcPNOhCS43JWYdusj+ycQrUqVr
	pOpV/hd5RqmsC3O8P9W5BIdVwRcrmBGD95GFxgDgQLcbsVKy2p93MBo1txZF7j5ASoJOdTI93dZ
	oXUHklZ42l9wv40s3L+7m3S/k5BNhrfN+WiCvRlOH95ME76TwpLePkhATJzUcJ6wZmNiO3aJPzB
	hrczNt0iKBGwy1gIQxr6ge88OuQepR4r
X-Google-Smtp-Source: AGHT+IGglrekvKKTqqsY8LE2N+RmZaoeHCt9yP48Sso0w5nnfmLh8mPNzUHKoOLK/L5/37jluV81wQ==
X-Received: by 2002:a05:600c:1d21:b0:434:9cc4:5139 with SMTP id 5b1f17b1804b1-434ddeb0492mr2236875e9.17.1733421229341;
        Thu, 05 Dec 2024 09:53:49 -0800 (PST)
Received: from ta2.c.googlers.com.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d5280fc4sm67882835e9.24.2024.12.05.09.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 09:53:48 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	peter.griffin@linaro.org,
	javierm@redhat.com,
	tzimmermann@suse.de,
	daniel.lezcano@linaro.org,
	vincent.guittot@linaro.org,
	ulf.hansson@linaro.org,
	arnd@arndb.de,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 1/3] dt-bindings: firmware: add samsung,exynos-acpm-ipc bindings
Date: Thu,  5 Dec 2024 17:53:43 +0000
Message-ID: <20241205175345.201595-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241205175345.201595-1-tudor.ambarus@linaro.org>
References: <20241205175345.201595-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for the samsung exynos ACPM mailbox protocol.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 .../firmware/samsung,exynos-acpm-ipc.yaml     | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/samsung,exynos-acpm-ipc.yaml

diff --git a/Documentation/devicetree/bindings/firmware/samsung,exynos-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/samsung,exynos-acpm-ipc.yaml
new file mode 100644
index 000000000000..bfc9b4af9ea1
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/samsung,exynos-acpm-ipc.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2024 Linaro Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/samsung,exynos-acpm-ipc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung exynos ACPM mailbox protocol
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
+  $nodename:
+    const: acpm_ipc
+
+  compatible:
+    const: google,gs101-acpm-ipc
+
+  mboxes:
+    description:
+      List of phandle and mailbox channel specifiers.
+    maxItems: 1
+
+  shmem:
+    description:
+      List of phandle pointing to the shared memory (SHM) area. The memory
+      contains channels configuration data and the TX/RX ring buffers that
+      are used for passing messages to/from the ACPM firmware.
+    maxItems: 1
+
+  initdata-base:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Base address of the configuration data in the shared memory.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - mboxes
+  - shmem
+  - initdata-base
+
+examples:
+  - |
+    firmware {
+        acpm_ipc: acpm_ipc {
+            compatible = "google,gs101-acpm-ipc";
+            mboxes = <&ap2apm_mailbox 0>;
+            shmem = <&apm_sram>;
+            initdata-base = <0xa000>;
+        };
+    };
-- 
2.47.0.338.g60cca15819-goog

