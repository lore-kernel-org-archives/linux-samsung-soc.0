Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CBA2D5A0C
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Oct 2025 09:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760002295; cv=none; b=ESgEdiB6fTF0Yrj+3dzWPDuY57VIxNQQczZKDFVDh3wv1BIMmqx1hK0SbXzMPz8hgfnw/vI3xho/gveLDtzj5oooHobUiu73A+ADzmFKKYSv80p9i2GHjA5Ths+GXKCQKr2cRiPb98+48sx3EWithWYhrmN4/frf5w/MTzHojWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760002295; c=relaxed/simple;
	bh=fHXP0rS4JI6KDuxvlZgz9enJGROeMTSVo5DeG6XAiHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jSwMlvwMAsJsJ/cwc/zhHEWPvvyN3Yyt4c64raT5tMymU/qpz2Lfr6IOfoJXwij5jPA9x2nM44ENlCWHectOU5q9s2m8rtnA/PR4EZGmKYWjufdCSopSv+R1F1vSpqYFLyVlvg+MgcjzJGhBjL25NC8u/84Y+FddSRN+ixXlnds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fY9SQRUH; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fY9SQRUH"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b41870fef44so127796566b.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Oct 2025 02:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760002290; x=1760607090; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhussLXTIAaNHdl08VkFOLu+6BznRfG9t4I2FdNWhpY=;
        b=fY9SQRUHfSP6vCHgKu8TQRO0ld7yz+2gnQvMUBNj/ErXYplONDml/1FgrPQqLTOMsD
         ENeoFru2mcSYIdsPPDPI7CQqM/rElqg0Ge9zRy4RIj42ak4PAfTZm/1JRhVzJ9iqqwOy
         t4zkf/UKG2aBiv3SDox5B/p+zqym8AJ6pGUZIV3Q1qVdwxr5UgIEjAgHvQ9woWeozSgS
         Ld7qPLZ9F2GHDjF+l9jsmfSf7e8YJARzNgGwDnw4pO4cEMoMTqrOKuP3aFGM3+eBBk2d
         jFd9NT1RXXjpk6GjOM2C89e4Fw+bqPHnvUPikpbP6LblrLYLID1xnvfIWSUUOwwir+1E
         aj+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760002290; x=1760607090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhussLXTIAaNHdl08VkFOLu+6BznRfG9t4I2FdNWhpY=;
        b=ZKPddXlPUb8VR7BoooHs9gdc+o91sNyRPQBHXIUXPCOhSVMLPyE2Qr4Pvc71iRKywq
         qrq5CKsN2Q8gaqXvw85aHptzAkFw0uiPbiS6KLK5RzBaIhRYJVZh710YXBQbYkAvlMdd
         N+ntZ/tCxnIMTKfYZoS6UBj2++e8MSF23qYFg6rDRceo487+D18KfwuvxF+t2EpbLNX3
         9n1JA/ggvcKHkPPZ2CtAld4MMfDc01I0jonX0pJIoptmYQEV228CI8D8f/nb79tHWotM
         XlsyBm22HI+NjdXAoqXVhAcSGHK/rYXJq8qnaOfnONoHWVQ2KDxt2Su6rIN9FrnsUw58
         SAwg==
X-Forwarded-Encrypted: i=1; AJvYcCXsXPOhiNnw5RH1VpN6ZASJr4JYSZk7USuKxhJUJ9WKqBQ71ISwSLJh7xhiL057qjlYS6pP7z2Wss2y0lCKdivDQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRfqG0Qt0a2KIz7TkzoghWSsxKqZmRsmqa3BHk25cCU8dGX/fN
	8s5h15aHTMsXW3asmygRJsPnFKB9+kPqkxMG/Qtf6NMNP237e6xCv0DE3v2S2heXyqo=
X-Gm-Gg: ASbGncsF4/uKdYVx+z+0Gv1sUF3lsSo9KSFj0zlvjN6OzAyBI62aufOjOanPYuD06pu
	2GpmMkxet0ZhuezQJUIfrAhUEkcT8pVO7QO/r4bYC8WWbGkiyt6Gmd7eLgrK1SRNqbawrMHu4ji
	vOH7/pPyJ6CY+UriyzRGMrrt86U4g6jkcK67CA6ixaRSJlJ4VPRss+FDQlR6mn0OfgqExIFpqpp
	9E0dtClGWOiiYLvAm85j1BwUSlTEUF2H+y/vGg/oCSMM5oyUF1e3Jh3liLzEqh0pVmBvIC+jbU5
	8BVW1WiWY6xEZiOiDCZDiIdBaV3HWl1FsvkqK3JLEdnmzf9GJs0NMJ98iQ+vjKtmIEhmfDlaIWV
	PS4FTeFv6JLU4v3gTRjwYwzZQkOVZ1ZYpA0zp4LImpJxOyrEy1W7QY46vNOjhKXVn7GQTajcCs+
	gccKnjX0Oikmi9j3WVavnGXv416Sgoqx+6r66YF7zF
X-Google-Smtp-Source: AGHT+IFbSjFx0LgIGYF3AQ4EuYGAUDxL0vR9eK74H8BpGxWhNh/p8idh9Q02LxhdowVy2TFNboIGaQ==
X-Received: by 2002:a17:906:3394:b0:b46:cc3b:65f8 with SMTP id a640c23a62f3a-b50ac5d08afmr585251966b.45.1760002289908;
        Thu, 09 Oct 2025 02:31:29 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173a41sm1855670766b.87.2025.10.09.02.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 02:31:29 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 09 Oct 2025 10:31:26 +0100
Subject: [PATCH v2 2/3] soc: samsung: exynos-pmu: move some gs101 related
 code into new file
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251009-gs101-pmu-regmap-tables-v2-2-2d64f5261952@linaro.org>
References: <20251009-gs101-pmu-regmap-tables-v2-0-2d64f5261952@linaro.org>
In-Reply-To: <20251009-gs101-pmu-regmap-tables-v2-0-2d64f5261952@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>
X-Mailer: b4 0.14.2

To avoid cluttering common code, move most of the gs101 code into a new
file, gs101-pmu.c

More code is going to be added for gs101 - having it all in one file
helps keeping the common code (file) more readable. While at it, rename
variables 'ctx' to 'context' for consistency.

No functional change.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* update gs101-pmu.c header to C-style (Sam)
* ctx -> context
---
 MAINTAINERS                      |   1 +
 drivers/soc/samsung/Makefile     |   3 +-
 drivers/soc/samsung/exynos-pmu.c | 133 ------------------------------------
 drivers/soc/samsung/exynos-pmu.h |   7 ++
 drivers/soc/samsung/gs101-pmu.c  | 142 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 152 insertions(+), 134 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3439485437117aaffbe61b709468348231ca3cc4..b8908a95abc561ecf04be560f0e358c58acad693 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10599,6 +10599,7 @@ F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c
+F:	drivers/soc/samsung/gs101-pmu.c
 F:	drivers/phy/samsung/phy-gs101-ufs.c
 F:	include/dt-bindings/clock/google,gs101.h
 K:	[gG]oogle.?[tT]ensor
diff --git a/drivers/soc/samsung/Makefile b/drivers/soc/samsung/Makefile
index 248a33d7754af1a1e5fbbbb79413eb300bbbc8e5..636a762608c9ba2c22a72d6f9597ceb015f7f36c 100644
--- a/drivers/soc/samsung/Makefile
+++ b/drivers/soc/samsung/Makefile
@@ -6,7 +6,8 @@ exynos_chipid-y			+= exynos-chipid.o exynos-asv.o
 
 obj-$(CONFIG_EXYNOS_USI)	+= exynos-usi.o
 
-obj-$(CONFIG_EXYNOS_PMU)	+= exynos-pmu.o
+obj-$(CONFIG_EXYNOS_PMU)	+= exynos_pmu.o
+exynos_pmu-y			+= exynos-pmu.o gs101-pmu.o
 
 obj-$(CONFIG_EXYNOS_PMU_ARM_DRIVERS)	+= exynos3250-pmu.o exynos4-pmu.o \
 					exynos5250-pmu.o exynos5420-pmu.o
diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index 9f416de03610b1727d8cc77616e5c87e2525cc69..528fd4bd96f515a15b0bf8d67c505f7a84c0fc2e 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -6,7 +6,6 @@
 // Exynos - CPU PMU(Power Management Unit) support
 
 #include <linux/array_size.h>
-#include <linux/arm-smccc.h>
 #include <linux/bitmap.h>
 #include <linux/cpuhotplug.h>
 #include <linux/cpu_pm.h>
@@ -25,14 +24,6 @@
 
 #include "exynos-pmu.h"
 
-#define PMUALIVE_MASK			GENMASK(13, 0)
-#define TENSOR_SET_BITS			(BIT(15) | BIT(14))
-#define TENSOR_CLR_BITS			BIT(15)
-#define TENSOR_SMC_PMU_SEC_REG		0x82000504
-#define TENSOR_PMUREG_READ		0
-#define TENSOR_PMUREG_WRITE		1
-#define TENSOR_PMUREG_RMW		2
-
 struct exynos_pmu_context {
 	struct device *dev;
 	const struct exynos_pmu_data *pmu_data;
@@ -54,125 +45,6 @@ static struct exynos_pmu_context *pmu_context;
 /* forward declaration */
 static struct platform_driver exynos_pmu_driver;
 
-/*
- * Tensor SoCs are configured so that PMU_ALIVE registers can only be written
- * from EL3, but are still read accessible. As Linux needs to write some of
- * these registers, the following functions are provided and exposed via
- * regmap.
- *
- * Note: This SMC interface is known to be implemented on gs101 and derivative
- * SoCs.
- */
-
-/* Write to a protected PMU register. */
-static int tensor_sec_reg_write(void *context, unsigned int reg,
-				unsigned int val)
-{
-	struct arm_smccc_res res;
-	unsigned long pmu_base = (unsigned long)context;
-
-	arm_smccc_smc(TENSOR_SMC_PMU_SEC_REG, pmu_base + reg,
-		      TENSOR_PMUREG_WRITE, val, 0, 0, 0, 0, &res);
-
-	/* returns -EINVAL if access isn't allowed or 0 */
-	if (res.a0)
-		pr_warn("%s(): SMC failed: %d\n", __func__, (int)res.a0);
-
-	return (int)res.a0;
-}
-
-/* Read/Modify/Write a protected PMU register. */
-static int tensor_sec_reg_rmw(void *context, unsigned int reg,
-			      unsigned int mask, unsigned int val)
-{
-	struct arm_smccc_res res;
-	unsigned long pmu_base = (unsigned long)context;
-
-	arm_smccc_smc(TENSOR_SMC_PMU_SEC_REG, pmu_base + reg,
-		      TENSOR_PMUREG_RMW, mask, val, 0, 0, 0, &res);
-
-	/* returns -EINVAL if access isn't allowed or 0 */
-	if (res.a0)
-		pr_warn("%s(): SMC failed: %d\n", __func__, (int)res.a0);
-
-	return (int)res.a0;
-}
-
-/*
- * Read a protected PMU register. All PMU registers can be read by Linux.
- * Note: The SMC read register is not used, as only registers that can be
- * written are readable via SMC.
- */
-static int tensor_sec_reg_read(void *context, unsigned int reg,
-			       unsigned int *val)
-{
-	*val = pmu_raw_readl(reg);
-	return 0;
-}
-
-/*
- * For SoCs that have set/clear bit hardware this function can be used when
- * the PMU register will be accessed by multiple masters.
- *
- * For example, to set bits 13:8 in PMU reg offset 0x3e80
- * tensor_set_bits_atomic(ctx, 0x3e80, 0x3f00, 0x3f00);
- *
- * Set bit 8, and clear bits 13:9 PMU reg offset 0x3e80
- * tensor_set_bits_atomic(0x3e80, 0x100, 0x3f00);
- */
-static int tensor_set_bits_atomic(void *ctx, unsigned int offset, u32 val,
-				  u32 mask)
-{
-	int ret;
-	unsigned int i;
-
-	for (i = 0; i < 32; i++) {
-		if (!(mask & BIT(i)))
-			continue;
-
-		offset &= ~TENSOR_SET_BITS;
-
-		if (val & BIT(i))
-			offset |= TENSOR_SET_BITS;
-		else
-			offset |= TENSOR_CLR_BITS;
-
-		ret = tensor_sec_reg_write(ctx, offset, i);
-		if (ret)
-			return ret;
-	}
-	return 0;
-}
-
-static bool tensor_is_atomic(unsigned int reg)
-{
-	/*
-	 * Use atomic operations for PMU_ALIVE registers (offset 0~0x3FFF)
-	 * as the target registers can be accessed by multiple masters. SFRs
-	 * that don't support atomic are added to the switch statement below.
-	 */
-	if (reg > PMUALIVE_MASK)
-		return false;
-
-	switch (reg) {
-	case GS101_SYSIP_DAT0:
-	case GS101_SYSTEM_CONFIGURATION:
-		return false;
-	default:
-		return true;
-	}
-}
-
-static int tensor_sec_update_bits(void *ctx, unsigned int reg,
-				  unsigned int mask, unsigned int val)
-{
-
-	if (!tensor_is_atomic(reg))
-		return tensor_sec_reg_rmw(ctx, reg, mask, val);
-
-	return tensor_set_bits_atomic(ctx, reg, val, mask);
-}
-
 void pmu_raw_writel(u32 val, u32 offset)
 {
 	writel_relaxed(val, pmu_base_addr + offset);
@@ -244,11 +116,6 @@ static const struct regmap_config regmap_pmu_intr = {
 	.use_raw_spinlock = true,
 };
 
-static const struct exynos_pmu_data gs101_pmu_data = {
-	.pmu_secure = true,
-	.pmu_cpuhp = true,
-};
-
 /*
  * PMU platform driver and devicetree bindings.
  */
diff --git a/drivers/soc/samsung/exynos-pmu.h b/drivers/soc/samsung/exynos-pmu.h
index 1658a55fe61c6fe70cc4cb0fcdcea2756096a268..fbe381e2a2e1062c318b10b3df171e328901fa7a 100644
--- a/drivers/soc/samsung/exynos-pmu.h
+++ b/drivers/soc/samsung/exynos-pmu.h
@@ -70,7 +70,14 @@ extern const struct exynos_pmu_data exynos4412_pmu_data;
 extern const struct exynos_pmu_data exynos5250_pmu_data;
 extern const struct exynos_pmu_data exynos5420_pmu_data;
 #endif
+extern const struct exynos_pmu_data gs101_pmu_data;
 
 extern void pmu_raw_writel(u32 val, u32 offset);
 extern u32 pmu_raw_readl(u32 offset);
+
+int tensor_sec_reg_write(void *context, unsigned int reg, unsigned int val);
+int tensor_sec_reg_read(void *context, unsigned int reg, unsigned int *val);
+int tensor_sec_update_bits(void *context, unsigned int reg, unsigned int mask,
+			   unsigned int val);
+
 #endif /* __EXYNOS_PMU_H */
diff --git a/drivers/soc/samsung/gs101-pmu.c b/drivers/soc/samsung/gs101-pmu.c
new file mode 100644
index 0000000000000000000000000000000000000000..ec345d09f21fca8692c3ba2a61feae5615bbef51
--- /dev/null
+++ b/drivers/soc/samsung/gs101-pmu.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 Linaro Ltd.
+ *
+ * GS101 PMU (Power Management Unit) support
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/array_size.h>
+#include <linux/soc/samsung/exynos-pmu.h>
+#include <linux/soc/samsung/exynos-regs-pmu.h>
+
+#include "exynos-pmu.h"
+
+#define PMUALIVE_MASK			GENMASK(13, 0)
+#define TENSOR_SET_BITS			(BIT(15) | BIT(14))
+#define TENSOR_CLR_BITS			BIT(15)
+#define TENSOR_SMC_PMU_SEC_REG		0x82000504
+#define TENSOR_PMUREG_READ		0
+#define TENSOR_PMUREG_WRITE		1
+#define TENSOR_PMUREG_RMW		2
+
+const struct exynos_pmu_data gs101_pmu_data = {
+	.pmu_secure = true,
+	.pmu_cpuhp = true,
+};
+
+/*
+ * Tensor SoCs are configured so that PMU_ALIVE registers can only be written
+ * from EL3, but are still read accessible. As Linux needs to write some of
+ * these registers, the following functions are provided and exposed via
+ * regmap.
+ *
+ * Note: This SMC interface is known to be implemented on gs101 and derivative
+ * SoCs.
+ */
+
+/* Write to a protected PMU register. */
+int tensor_sec_reg_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct arm_smccc_res res;
+	unsigned long pmu_base = (unsigned long)context;
+
+	arm_smccc_smc(TENSOR_SMC_PMU_SEC_REG, pmu_base + reg,
+		      TENSOR_PMUREG_WRITE, val, 0, 0, 0, 0, &res);
+
+	/* returns -EINVAL if access isn't allowed or 0 */
+	if (res.a0)
+		pr_warn("%s(): SMC failed: %d\n", __func__, (int)res.a0);
+
+	return (int)res.a0;
+}
+
+/* Read/Modify/Write a protected PMU register. */
+static int tensor_sec_reg_rmw(void *context, unsigned int reg,
+			      unsigned int mask, unsigned int val)
+{
+	struct arm_smccc_res res;
+	unsigned long pmu_base = (unsigned long)context;
+
+	arm_smccc_smc(TENSOR_SMC_PMU_SEC_REG, pmu_base + reg,
+		      TENSOR_PMUREG_RMW, mask, val, 0, 0, 0, &res);
+
+	/* returns -EINVAL if access isn't allowed or 0 */
+	if (res.a0)
+		pr_warn("%s(): SMC failed: %d\n", __func__, (int)res.a0);
+
+	return (int)res.a0;
+}
+
+/*
+ * Read a protected PMU register. All PMU registers can be read by Linux.
+ * Note: The SMC read register is not used, as only registers that can be
+ * written are readable via SMC.
+ */
+int tensor_sec_reg_read(void *context, unsigned int reg, unsigned int *val)
+{
+	*val = pmu_raw_readl(reg);
+	return 0;
+}
+
+/*
+ * For SoCs that have set/clear bit hardware this function can be used when
+ * the PMU register will be accessed by multiple masters.
+ *
+ * For example, to set bits 13:8 in PMU reg offset 0x3e80
+ * tensor_set_bits_atomic(ctx, 0x3e80, 0x3f00, 0x3f00);
+ *
+ * Set bit 8, and clear bits 13:9 PMU reg offset 0x3e80
+ * tensor_set_bits_atomic(0x3e80, 0x100, 0x3f00);
+ */
+static int tensor_set_bits_atomic(void *context, unsigned int offset, u32 val,
+				  u32 mask)
+{
+	int ret;
+	unsigned int i;
+
+	for (i = 0; i < 32; i++) {
+		if (!(mask & BIT(i)))
+			continue;
+
+		offset &= ~TENSOR_SET_BITS;
+
+		if (val & BIT(i))
+			offset |= TENSOR_SET_BITS;
+		else
+			offset |= TENSOR_CLR_BITS;
+
+		ret = tensor_sec_reg_write(context, offset, i);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+static bool tensor_is_atomic(unsigned int reg)
+{
+	/*
+	 * Use atomic operations for PMU_ALIVE registers (offset 0~0x3FFF)
+	 * as the target registers can be accessed by multiple masters. SFRs
+	 * that don't support atomic are added to the switch statement below.
+	 */
+	if (reg > PMUALIVE_MASK)
+		return false;
+
+	switch (reg) {
+	case GS101_SYSIP_DAT0:
+	case GS101_SYSTEM_CONFIGURATION:
+		return false;
+	default:
+		return true;
+	}
+}
+
+int tensor_sec_update_bits(void *context, unsigned int reg, unsigned int mask,
+			   unsigned int val)
+{
+	if (!tensor_is_atomic(reg))
+		return tensor_sec_reg_rmw(context, reg, mask, val);
+
+	return tensor_set_bits_atomic(context, reg, val, mask);
+}

-- 
2.51.0.710.ga91ca5db03-goog

