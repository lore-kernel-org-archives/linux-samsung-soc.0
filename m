Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEED037F00B
	for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Sep 2026 20:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790628909; cv=none; b=PruQBUjG2Bt7ah3O93pVMM2Y+3kiNrtRDU5ZrZD1Wmwb72gYmideeN0sUwGKICQh+4X9kYGiu+96jrLF0RhDG3AkkXOHhJ2qfqtUWBJs3N5gTLbmBVorC5NjdnoaZ16P9hJvypQqFn1lIMTsXqXlzRistiDwHiTIznpk//0Yb9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790628909; c=relaxed/simple;
	bh=IetCF2iLNTqjr0dcd7lwVVmU5VHZQGADh8wvTdWo6og=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XIzRilBthcvoPoxTBmdGzPneAOz76pDK2pLJRKbXIDVZGt6hQL9WSgtuuUTypFhNikfOfy78CFA1rznK6dOfIw+4cR4sawGPUzgHEZJ+1wx01I2D7yLnHisSD0lDdCQe96Gp3lcAbTIHMf4uT3FLJV60b3rOIuU01lykBPmGwF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OomBSJQO; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OomBSJQO"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffe817151so12573385e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Sep 2026 13:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790628905; x=1791233705; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OXzj0ZFYh/jUSpJwEEvbFV0ZjydMgR9QhJ6OmvWu+pM=;
        b=OomBSJQOYVacvCDFa8wDC1pIfyB6RMLB0zbpJR5uwZXXYAynivWD+RBuLFbtcrmADJ
         TGfmKxoPPZbbK6uERlQ142yRW9gB2dBJ931PrD6t1EwftM+eJdMkdtbVl8NqhNg029MD
         jok3Zo6maCC1VHRLoNkJKr3Rq5peq6I3mF9+M8jzWooPBo4ORE3e489pBFGXW7T1y1vg
         dCTH57tJs+GbGOIoO3MPc01EGbYhDIsXxwHkoBXzr02eO+iCnC4XWbHByYOr3InhRxzY
         X4IJfKBIsueT16udoj3j13aPRBnZnOVWHdlYYi0a5vVUxsRXEU+TOapGNRdERQVvLVdz
         pAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790628905; x=1791233705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OXzj0ZFYh/jUSpJwEEvbFV0ZjydMgR9QhJ6OmvWu+pM=;
        b=hJjPUr/253EFc5500cZAxpbSDd8EjMDzleNT2PQPpckiYmyh1iQCFjqvT463L6l6oR
         BVjmcutVpiV4XAyEwGPfkJzbd/QXRQ79f9v26rJD9ZIymmMItnsP5u3I3STKL+QaC6lG
         zvRMGrhVPa0toXU5KDkBWtQvBfjFMvqR4B8QB/MY6UQp/NxADneqttegUWN6/kksK0ud
         Ck1lDs3a44HtqDh3QLteEAceFnFgPHo+kMLqtnlmb2EUcMGwRerOpsW5Nb8m3i5LUFnk
         F3fXXo+YyDOh88gilJeQEnnQ5+PJsDstgiZ53yvz6yafgh+8UT7wPz7iQRxiz1y5YZZX
         JT/Q==
X-Forwarded-Encrypted: i=1; AKwUvByr40B7OhZP0K9ThBAAR8v3pJvDJDcm+CTZZAWMwStTxp5oL7wNw0OuQ8+5EqtwzxAmozsCGVHqU1ECivjDg1ZluA==@vger.kernel.org
X-Gm-Message-State: AFuF++n6beEh2nKP7GLwX3mAsn0NvoThH5LjPc6wgIjplNm/nncC3YWD
	JS4ZAAMNSfWlyorAwCvdgt1NQZMkErvwiHfeLavi2V7uQGep1ovFAnTOuKKuWU+o5ng=
X-Gm-Gg: AYBFou3sn+zIVrn1/63SchsNXJxSDnAaUr52HOwnEQgYFV4MYs9Tf/9GoREpFuaj8xr
	09fdNbuwOUYQjYEUBEP8votiaH8vcA4Rr92eEHsS46HMkBQjTLRyd7t9UM78Y/1rMr/GrKRh7JG
	fB/I+tpWPfiy3ZzxRZ79oFGG3HjTYHXhk0uWWLv6zOEjzTAmGX+CdvmYgdOj7ox2Jz1MFs/f0sG
	393v9S+cUbOPj+mq/aYRLjhmOdLY0em2tq0eZg9G1HLjoQh03HR7u8wdZvtZMMnq9JDa/IDd6bd
	VwHEAGfQ/ocGEvwmVZH/1J0tsQrfoFNEt/AestXTAH+WyiG2eZwKYFmmD2lb0YmhrMSbI9ni2T2
	/ihHLzDk/HPJvyxBKRQW/yjhDdjmYSLYLlKUsIbHiqmFQCe5dvfmkoTEinctpuLZGlb8sVTe+4A
	j8naGecTeftXG6rktrodu330ySJ0VYg3l+rw6jis63JrsoRfTd4fK4lahNOqK0/baHvmbcZ6zAA
	2GOjy5EIsIpxlzlqfznQGb/VLMqbVSfTjQntZhitnazuD13oxwDGB4ggIL1L09l0sT4mwVa
X-Received: by 2002:a05:600c:4f50:b0:4a0:8b1:f5c with SMTP id 5b1f17b1804b1-4a008b11c38mr44624795e9.22.1790628905176;
        Mon, 28 Sep 2026 13:55:05 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfec703sm18042045e9.6.2026.09.28.13.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 13:55:04 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 28 Sep 2026 21:55:02 +0100
Subject: [PATCH v2 1/2] dt-bindings: firmware: google,gs101-acpm-ipc:
 document Exynos850 compatible
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-exynos850-acpm-firmware-support-v2-1-717acef9469a@linaro.org>
References: <20260928-exynos850-acpm-firmware-support-v2-0-717acef9469a@linaro.org>
In-Reply-To: <20260928-exynos850-acpm-firmware-support-v2-0-717acef9469a@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

The Exynos850 SoC incorporates an APM co-processor. Communication with this
hardware block is done using the ACPM protocol, which handles IPC messages
for clocks, power, thermal management and PMIC control. In this
architecture, the ACPM firmware running on the APM acts as the central
supervisor or arbiter for shared system resources, handling requests from
clients or agents such as an OSPM. In this design, the OSPM is one of
several clients or agents communicating with APM.

Dedicated compatible string is required for the Exynos850 because
its firmware utilizes a different initialisation data base offset
(0x7000) compared to the existing GS101 implementation (0xa000).

Additionally, the ACPM firmware implementation on Exynos850 does not cover
all clock management operations (such as clock rate reads over ACPM IPC).
To allow the OSPM to resolve rates for these ACPM clock IDs or sometimes
called domains, add 'clocks' and 'clock-names' properties to reference the
underlying physical clocks.

Add the "samsung,exynos850-acpm-ipc" compatible string, binding defines for
Exynos850 ACPM clock IDs, clock property constraints, and disallow GS101-
specific PMIC child nodes for Exynos850.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 54 +++++++++++++++++++++-
 include/dt-bindings/clock/samsung,exynos850-acpm.h | 21 +++++++++
 2 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index e68f9c3ca5e2..f9ef5645b8bb 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -22,7 +22,9 @@ description: |
 
 properties:
   compatible:
-    const: google,gs101-acpm-ipc
+    enum:
+      - google,gs101-acpm-ipc
+      - samsung,exynos850-acpm-ipc
 
   "#clock-cells":
     const: 1
@@ -33,6 +35,20 @@ properties:
       appropriately with the clock scaling. The argument is the ID of the
       clock contained by the firmware messages.
 
+  clocks:
+    minItems: 1
+    maxItems: 9
+    description:
+      Phandles to the underlying clocks associated with each ACPM clock
+      domain. This property relates to ACPM firmware variants where not all
+      clock operations are implemented.
+
+  clock-names:
+    minItems: 1
+    maxItems: 9
+    description:
+      Names of the ACPM clock domains corresponding to entries in 'clocks'.
+
   mboxes:
     maxItems: 1
 
@@ -77,6 +93,42 @@ required:
   - mboxes
   - shmem
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-acpm-ipc
+    then:
+      properties:
+        clocks: false
+        clock-names: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos850-acpm-ipc
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: mif
+            - const: int
+            - const: cpucl0
+            - const: cpucl1
+            - const: g3d
+            - const: aud
+            - const: cam
+            - const: disp
+            - const: cp
+        pmic: false
+        pmic-1: false
+        pmic-2: false
+      required:
+        - clocks
+        - clock-names
+
 additionalProperties: false
 
 examples:
diff --git a/include/dt-bindings/clock/samsung,exynos850-acpm.h b/include/dt-bindings/clock/samsung,exynos850-acpm.h
new file mode 100644
index 000000000000..87fc6ccc1d99
--- /dev/null
+++ b/include/dt-bindings/clock/samsung,exynos850-acpm.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2026 Linaro Ltd.
+ *
+ * Device Tree binding constants for Exynos850 ACPM clock controller.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H
+#define _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H
+
+#define EXYNOS850_CLK_ACPM_DVFS_MIF			0
+#define EXYNOS850_CLK_ACPM_DVFS_INT			1
+#define EXYNOS850_CLK_ACPM_DVFS_CPUCL0			2
+#define EXYNOS850_CLK_ACPM_DVFS_CPUCL1			3
+#define EXYNOS850_CLK_ACPM_DVFS_G3D			4
+#define EXYNOS850_CLK_ACPM_DVFS_AUD			5
+#define EXYNOS850_CLK_ACPM_DVFS_CAM			6
+#define EXYNOS850_CLK_ACPM_DVFS_DISP			7
+#define EXYNOS850_CLK_ACPM_DVFS_CP			8
+
+#endif /* _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H */

-- 
2.51.0

