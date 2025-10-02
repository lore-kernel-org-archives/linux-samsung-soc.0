Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F81F30AAB6
	for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Oct 2025 10:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759401184; cv=none; b=XqGXruUcqLBVHnsl9oMjtOjkFTCr+mlEbVSvVwubf1XpUUgZLnZ++PZ8E/w0DsTAE7MmiO+ie1ZfWC2h8Tc86I6QxBr01Ol9+zSlXIuWtp9ysEUQ4LmkdaudDBM38k9tdNvrcEqCpZAL39+Wo8v+6GyFV/6Ax0YKy3JaanvK+Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759401184; c=relaxed/simple;
	bh=h+deIHicwrHQ19r1zRDgORFTgXtJbtjR/6EWF/Z7L0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rmr0/vdI1M/I1ABmY71qENNJeozpo73lA34ZI+l24QN8UDptAAO8f82VaI0fDsKoOw53ut0ZKTuq9Lj54tzMxMYoVnXO0ZvwqGxO5NhVp1ePCW1ATPG4sqhG+N4TD3zlbfMiCkOb67/dbxlaW+BcKRJ9ZUHtEZADMDYteQ3sI1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AAspXcRW; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AAspXcRW"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6366b7fd337so1549273a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Oct 2025 03:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759401181; x=1760005981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xo6kT9mOeoGN3BYYGZkUa2NTgKMCQnBcHGUxc+bh1lY=;
        b=AAspXcRWGOczZyEX7Wd4b5gHt2len1C8SgORv1nL57yDaVDbQ1sq7rSyf36cvcyJIs
         ZsduJMVLQPtFJhkYeADXF1JlMrbm2B/R5iAvPSyHOtnjFU9WC+Uo3xgkTlBT8buawxEm
         R5kGYpl7ooegaEaF9PAL0KpXSmjH1eZBWCRtr+GeHSgYwsO0erby8CgBCyqj1Fy+Ked9
         vvMzUlh19DP0bwj4r5wwL+ADuVNjCw10ILYofeC8ZvseY1TDIRPGWKf86gtOYetgtdYm
         MPpwLJq3Je1x0a5LrRwkx+LaSI40XLIhmdNfCe3bpTzBTUPBx9oa3+AJNSvMQ6k+kFak
         UL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759401181; x=1760005981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xo6kT9mOeoGN3BYYGZkUa2NTgKMCQnBcHGUxc+bh1lY=;
        b=ASnQjECf+gXdls2E5OvPNXA6a/lsb3pv5CuUtZFkd6c2CBekx09spXtKuFnCvMleCs
         hkH0jGlwJFb9twp9nxHSBalF4kfKQhGdXVovRUhbNn4nb6zRGqfteDDiSdI6KaucIlAp
         /zVi4a5BgJFF7BrZ6QOxHAPYP4bklQ70R75dEFu+b+ez8Nt2qQhIO2ZisCAIMU2saFDQ
         ZA/HoZ7Tp+5g0jeQZV3Lo2/JNY1oKnAGRrHOnfZDgfpf3yal2uNgr3AXYnBDRDx3E0uX
         1OYFgCmPz1GBsU7pNurTy25iyaeXwCbJ7BfF8PxEOFYGJhe9doUcrSrCyarQCU3IRyAl
         r3Yw==
X-Forwarded-Encrypted: i=1; AJvYcCXh6taLWXW16U29uEG1wJAtMvtP21r6wy2c8nVmU6CX5md5XYPot7Yh9kgrvx8AR52kQlj1IkfZEB56T7W0PvD9wg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5RKyBk75GwqjUQ4cFhahI6P68awIbptpZGWatMhG1GNx+gtQU
	LdSVSMSnLA8YH22eOV8z3vr4o8+AjgYEGuDjS58GVwzLgi9GP/T257ZUd3148WMNEim18EMjaKM
	s2Bi2g3Y=
X-Gm-Gg: ASbGnctpbjtO/B65mhsbjNyNW2LcALV8VkvliykI5L0MpYIZjtL5KaDz5IqmoF8i33p
	J7OFMqdJbhMHr/WcidL1eMhD/pkH1uTW3wRM/EC5wqgso1MzrKIw2UKdt5ovTTxHDfmfN89sGFb
	Rxh8lLdVes7SWSo1d8Eu7uzUelYRB4wxkc0HG3XKaf+fVOUXPV8cDEPFtHtxfD1TauMlhfKj2AO
	2AbiXAYnRimM96xKAjV7Nu1a4opGyoCdFPskX3RdItgaIBBIS8hhVAWGNC/ThWEt1dzxbUxSG1f
	WYfgDJ3e3AVLyXdKTpLl9pb24XlzL/5JRsdZv1mGbfdyKYjj4W22IygqB1mQnxlhPV+WupIRKG/
	89FqmdrIMzs54bTAMENk93GmKtJYYVCx4wjUxkfxt3IDTjVmkka8r9DqNYcQYeDRSPeLV0j6CDe
	Lu8sn2SZynf9wHQaIboarR2guw1wVhiudtoH7KK9cC
X-Google-Smtp-Source: AGHT+IFcurtZLBtnYvlHmu3EQsEwlUQtHmIyG3WXhoI59M5Q5mFpmMVVclCIte1fI6rAD+e4mYcyUg==
X-Received: by 2002:a17:907:a08a:b0:b41:6ab2:bc69 with SMTP id a640c23a62f3a-b46e1950d9dmr771895566b.22.1759401180811;
        Thu, 02 Oct 2025 03:33:00 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4871167172sm170262566b.65.2025.10.02.03.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 03:33:00 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 02 Oct 2025 11:32:58 +0100
Subject: [PATCH 2/3] soc: samsung: exynos-pmu: move some gs101 related code
 into new file
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251002-gs101-pmu-regmap-tables-v1-2-1f96f0920eb3@linaro.org>
References: <20251002-gs101-pmu-regmap-tables-v1-0-1f96f0920eb3@linaro.org>
In-Reply-To: <20251002-gs101-pmu-regmap-tables-v1-0-1f96f0920eb3@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

To avoid cluttering common code, move most of the gs101 code into a new
file, gs101-pmu.c

More code is going to be added for gs101 - having it all in one file
helps keeping the common code (file) more readable.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 MAINTAINERS                      |   1 +
 drivers/soc/samsung/Makefile     |   3 +-
 drivers/soc/samsung/exynos-pmu.c | 133 ------------------------------------
 drivers/soc/samsung/exynos-pmu.h |   7 ++
 drivers/soc/samsung/gs101-pmu.c  | 141 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 151 insertions(+), 134 deletions(-)

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
index 113149ed32c88a09b075be82050c26970e4c0620..fe11adc4f6ac8fc8bce228d5852deaff7c438221 100644
--- a/drivers/soc/samsung/exynos-pmu.h
+++ b/drivers/soc/samsung/exynos-pmu.h
@@ -44,7 +44,14 @@ extern const struct exynos_pmu_data exynos4412_pmu_data;
 extern const struct exynos_pmu_data exynos5250_pmu_data;
 extern const struct exynos_pmu_data exynos5420_pmu_data;
 #endif
+extern const struct exynos_pmu_data gs101_pmu_data;
 
 extern void pmu_raw_writel(u32 val, u32 offset);
 extern u32 pmu_raw_readl(u32 offset);
+
+int tensor_sec_reg_write(void *context, unsigned int reg, unsigned int val);
+int tensor_sec_reg_read(void *context, unsigned int reg, unsigned int *val);
+int tensor_sec_update_bits(void *ctx, unsigned int reg, unsigned int mask,
+			   unsigned int val);
+
 #endif /* __EXYNOS_PMU_H */
diff --git a/drivers/soc/samsung/gs101-pmu.c b/drivers/soc/samsung/gs101-pmu.c
new file mode 100644
index 0000000000000000000000000000000000000000..b5a535822ec830b751e36a33121e2a03ef2ebcb2
--- /dev/null
+++ b/drivers/soc/samsung/gs101-pmu.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright 2025 Linaro Ltd.
+//
+// GS101 PMU (Power Management Unit) support
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
+static int tensor_set_bits_atomic(void *ctx, unsigned int offset, u32 val,
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
+		ret = tensor_sec_reg_write(ctx, offset, i);
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
+int tensor_sec_update_bits(void *ctx, unsigned int reg, unsigned int mask,
+			   unsigned int val)
+{
+	if (!tensor_is_atomic(reg))
+		return tensor_sec_reg_rmw(ctx, reg, mask, val);
+
+	return tensor_set_bits_atomic(ctx, reg, val, mask);
+}

-- 
2.51.0.618.g983fd99d29-goog

