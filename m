Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14590748E
	for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Mar 2024 02:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710900355; cv=none; b=kGi+A/O82KJd8NTk84+cEMeWdj0eGT/2IIIEhf2mWEhj4pVcV1P4LqpaQAFNDjQldh+xycInDCamRDFVlgBLyc56I11RuoT+xek8KYGaB3CM8259CH1FyiEoVztMKj2+Q09qCoyBGDpC1oPMjsdrByjZnLXWNv2OXTPnj1Lmu5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710900355; c=relaxed/simple;
	bh=UDPA0ill2nwITsEd4B7gur+Ay98Nr/tWbJGEuMapLoo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SDJJsmUw+qfgu+loiZ4acSxzdZJdsfLjHfN3OEKu1W5oXNyYDamPeaUt+KdtKO+qQ+0Kf80vGB7k8IqljC2rEvJBDOyJXSP1qN71ae+fo7O2ShBPvMqMLikhqVRHmYO81yKXfqsn/+8KWd1LDhaAlP4kRr8x1iC1sTIX+eg0ILc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Si4oQMwE; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Si4oQMwE"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-34169f28460so1764144f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Mar 2024 19:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710900351; x=1711505151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MJbSfYpc/jJCFvciL1kM3GDBs5qlmkaejLmxGj8x3co=;
        b=Si4oQMwE4H/GNnHSK90+vLL9fQyZAjVHeyaM6dIwe6gYR2Ntm+Hkw62dAi+ZOp92sV
         1RDXzCcYdHxyOSorpoU8Aho0ydK3FZ2VL6fd5Z3+l9TiwYmIrMr9kSj6pDkkgniUpYVk
         nIyzSW22l0IMOWQ0+IGaHe/IQpZo3Lve8wI19FwfeIwp9p1T79zwMreixFc2CMFPgRC2
         HNnBBV0ZWsUxggT+dG5tcwEfcTnuQpnsuT9ER8uFYLXyq6BzwzXuH+7YeMjZxrXkU38O
         uLvIuebhKXMt4Q3Q+0q8U3Zzhbrsdax0Vfz8Mwpq8M5qGOOrVu1TbunJ6qABuUdUoTEV
         EA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710900351; x=1711505151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MJbSfYpc/jJCFvciL1kM3GDBs5qlmkaejLmxGj8x3co=;
        b=N+gthAxFcjUMNsby2H/f624BbukksyLrIj7iLlSKVtXoiNVyWCmhPACNORLbx8qB0N
         bSdL9K3plbV8fkA8ODt48bnfaQ0Eyfp+j8e/ZbIoelTcUsbuvJ6Ol6mxumrGV4pN6XTj
         pRcGdrgSh9EiZojn+Tn5tm0ZAT7lCPTor+zjzcelqJaQtrtoXcBKEiExqTt4OsuL+VTK
         48fa8pLLMwMlYtDj5x6QHWRtZRknMlrl8CNPO+36EfIcBQSHU8QzQDFSQG90s/DDBh9B
         noBRcKywypWavuIdFGVo2crRDHEsGCU8l+zrdMNpFzWqEbyfLYEgA/kdamj3+b1vuNHp
         nSxA==
X-Forwarded-Encrypted: i=1; AJvYcCVHISoMEMLCMtMFaErjmoGSDuW95alZWh0LONh2RCJWYnlsYVhJ9p8xnb1STUaJNjnZyhIMnYu1ZSRe3++WF5cet4UlvY6r/+01FnVbrewKcdw=
X-Gm-Message-State: AOJu0Yz9Rp0Qyr736mEvIya/QUQ3Nbd2L5EIvkmX4tw6foPRzS1V04Nd
	zsItjpvrZjALikKmrJxYiZY/u/74V4E8+OGmyYw6CpXnhuvWjWfDtSK/t9sgiNw=
X-Google-Smtp-Source: AGHT+IH/ytnOuoK/tbCb+jKMCYsJebzK8CKTqro9S3Oi5Rnu/OymshQKURc3tWsZeCaJ5TZYMJuCGQ==
X-Received: by 2002:a5d:5102:0:b0:341:938a:cd95 with SMTP id s2-20020a5d5102000000b00341938acd95mr590725wrt.0.1710900351339;
        Tue, 19 Mar 2024 19:05:51 -0700 (PDT)
Received: from localhost.localdomain ([2a02:c7c:7213:c700:e992:6869:474c:a63f])
        by smtp.gmail.com with ESMTPSA id u14-20020a056000038e00b0033e34c53354sm9209295wrf.56.2024.03.19.19.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 19:05:50 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: sre@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	peter.griffin@linaro.org,
	robh+dt@kernel.org
Cc: conor+dt@kernel.org,
	linux-samsung-soc@vger.kernel.org,
	semen.protsenko@linaro.org,
	linux-kernel@vger.kernel.org,
	klimov.linux@gmail.com,
	kernel-team@android.com,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	alexey.klimov@linaro.org,
	alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	elder@linaro.org
Subject: [PATCH 1/3] dt-bindings: power: reset: add gs101 poweroff bindings
Date: Wed, 20 Mar 2024 02:05:47 +0000
Message-ID: <20240320020549.71810-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../power/reset/google,gs101-poweroff.yaml    | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/reset/google,gs101-poweroff.yaml

diff --git a/Documentation/devicetree/bindings/power/reset/google,gs101-poweroff.yaml b/Documentation/devicetree/bindings/power/reset/google,gs101-poweroff.yaml
new file mode 100644
index 000000000000..d704bf28294a
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/reset/google,gs101-poweroff.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/reset/google,gs101-poweroff.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google GS101 poweroff driver
+
+maintainers:
+  - Alexey Klimov <alexey.klimov@linaro.org>
+
+description: |+
+  This is a Google Tensor gs101 poweroff driver using custom regmap
+  to map the poweroff register. The poweroff itself is performed with
+  a write to the poweroff register from a privileged mode. Since generic
+  syscon does not support this, the specific one is required.
+  The write to the poweroff register is defined by the register map pointed
+  by syscon reference plus the offset with the value and mask defined
+  in the poweroff node.
+  Default will be little endian mode, 32 bit access only.
+
+properties:
+  compatible:
+    const: google,gs101-poweroff
+
+  mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Update only the register bits defined by the mask (32 bit).
+
+  offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Offset in the register map for the poweroff register (in bytes).
+
+  samsung,syscon-phandle:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the PMU system controller node.
+
+required:
+  - compatible
+  - offset
+  - mask
+  - samsung,syscon-phandle
+
+additionalProperties: false
+
+examples:
+  - |
+    poweroff {
+        compatible = "google,gs101-poweroff";
+        samsung,syscon-phandle = <&pmu_syscon>;
+        offset = <0x10>;
+        mask = <0x42>;
+    };
-- 
2.43.0

