Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8139F19F115
	for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Apr 2025 16:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745598322; cv=none; b=l3UyNs0Sa4Vit4oSP+zhUYkP9CIwjq0F5SRwqzAbg+A+WEkJdf48ref0fVSXho9eo3G7h8CTiaf6B7NgT8H6rn35wfhOV9mJcpyKG0U7E46lrP/urbYXzUA6kh7LFIS1n211wMnwTnP42k/IdT3V/uyNBCKPGZcdVzenwlq3Udo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745598322; c=relaxed/simple;
	bh=PZeXIXkDDcpmQgKJeZih41sAPSvK23P8CuuqnIIfAAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PF/D6dvN1XrbNEKjyACmIRRCCm3gwCWrrjb4Yfe1ZoTeN5tzNxos5Ze+HO/A9ZkBshVypEGlvot6d0bfBTDcXgs1qOpIyN6Pes0oCJKJjBVCPPWpphdx2iE8vniSWt7PBY1QjUcLPlLrKP5jpmr096q9aBvMFZ00kKV6BGVqCX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vwiQlmJt; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vwiQlmJt"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so16552485e9.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Apr 2025 09:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745598319; x=1746203119; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dh3JAPmeTO24JV8tjKnvmXJ0A5D+UdZwLETNKz5WYnM=;
        b=vwiQlmJtXJV/h3jXldtH2sfCJDncszaYjAXMzZ3eQt3AghEZQHDYcze15S+a53En8v
         WJosrobISyCpbh7MLc00WgT7z9hJyZakwwfdj3jEROE1hliIzQFV1e4OdNUc99xosPBG
         D/ko1H8kEnyns31+BmQAdiE38NKrRTb9gaOYh91Ol8mZLSVpFM9eP4fPLPQV943KeAbi
         mGVezWKdgKYrVQjKSM2QxEd8m376Fjh8DvtqbrbYveSOdXdR6hrH2bjmjb5rwn5ab/xl
         JDBM1ToObHCykBNZJoObK3kwBBc1yof+uIFkt/64yENRsOn4Q/FEa6WYKfLOGWumN54S
         F25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745598319; x=1746203119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dh3JAPmeTO24JV8tjKnvmXJ0A5D+UdZwLETNKz5WYnM=;
        b=XdMX7Hwsl73ijaKX4raqFIpuaI57Hf+lj6HnNQspimLjkkSqcQBuVzKs6gSSgtwSNU
         mtg5U8y/WeTJBeUd7uqSfSA7YrFDPlhiV/3wFDkJHDNsqtU7RewAVoSzzg/HUxNR9AaO
         93RT3wMUQTosD2Gb7nljvO/L0w1cxsu5k0R/p8z6XDz7xeJWDrYI0+FR3UmGkI/revJp
         zVtliM8JtNngIA4wsS6AutshAh5Tu0B56X6WhHeTQz3yGmMXPgk5vzrTMxlgbFxRzvAm
         XmHzmF1NC6bqktNa4B8MsFjZte9EZH/ZPm3PS+jud7bMrX3fN6FcESJrprXqwmypmoqS
         XQOA==
X-Forwarded-Encrypted: i=1; AJvYcCVrYAkB9JD1jxYi+UYvwDjGu8WvrXm4yoAHjscqUjP6ildukHgUKS3Tc3iK8k/9KrkvaNf/+1pK3GQOt1FdoS7e0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLHQazYdCr9myNv4XYi9QAxXjEKhiNoD26Kmb4MePX7PZR+a7u
	8QbxFZsQa3IsKbiuU6WoQmYcBwOn1V+CeEoPWBCPM3kvePzMxMNNJwkvDanta30=
X-Gm-Gg: ASbGncv3MFjuuTmzOeXDiGlvSRProIoVRMwOMQuJDPcmzMFsbyW7xWBY8o2ovFYQW5H
	3IU3lA2mGAcRgr2Sf3ZTkd0JvLDxHZraUGJDepsVa0I4gBUkot9NB3p31Y1JmC6ZSvPJ6VMwXgs
	0ci+pph6Nw6o8IubaKsuq8HO/bgS/VxC/2HxrrP+9ibU6RvMMuxFOht/K9j5Q69SHhcqr4FNd2R
	MJ9wxZ27qofCfjQD6VNASSR3GdvHX1ann0AmMBM0INFJ2YZnhwP1MdiDlUgs0/jldEotGKs1OC+
	uHQb+xFj6xsqPJoCW1sVAwc/QTw9jOG8szlt/eDpThUJDb+PGINPrYw19jOKuy96nY3mVg4v
X-Google-Smtp-Source: AGHT+IFKKvFedp6Nrba9Tngbgf9SpS1hGHaYNhfmKqEeSci33u8z8xgydesf80nn0Tm7MAyxNYwdNg==
X-Received: by 2002:a05:600c:c05:b0:43d:d06:3798 with SMTP id 5b1f17b1804b1-440ab8487ecmr49275e9.20.1745598318756;
        Fri, 25 Apr 2025 09:25:18 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([209.198.129.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d8976sm61263715e9.27.2025.04.25.09.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 09:25:18 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 25 Apr 2025 17:25:09 +0100
Subject: [PATCH v2 5/5] soc: samsung: exynos-pmu: enable CPU hotplug
 support for gs101
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-5-f1530de9da42@linaro.org>
References: <20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-0-f1530de9da42@linaro.org>
In-Reply-To: <20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-0-f1530de9da42@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6366;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=PZeXIXkDDcpmQgKJeZih41sAPSvK23P8CuuqnIIfAAo=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoC7dmq3oTJNUSVcZNMDgal+g8VsnBj6q0mRp9y
 MIZcwsVuYWJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaAu3ZgAKCRDO6LjWAjRy
 urpHD/9YGmcsS5Hssr8QD/JYGFbcjtShr4T5lX2zBlVMTiOutjINyF2YxIgkyfxDB5lfiYvleHR
 f8ui92mF12LzOFxs4rKwSDnT/AZ0DfZS8UocWPFI7IvdAD5BuxK1QKnw8jYzKyOXNVcT2EgYsSP
 TY3fr8+PywCMDi1V73HoShuocmZzX1OlXqmD56m/ZxCWJVM+k1kgaPBga9OhpFABcfY8uwhkFPw
 fRAgs8LE4WzYkZMyOwmR96DLYgAa3aU2J/c26NMZdN8zPuBJN/v/tVM0zUgxocOpu2YgRCJjxcV
 dGcgRBdoTFhSKwhugSIVPyJJd12RxH/y4rF8WZiFiCPDD3jBUrfrHdozlNW25B05HkZ3+Lss1wq
 obpCTgZC9AW5SgPpyCmJE7bE76qUQ2gGPDHhsfXwW1gTqetT2UCbO6aCos8blko81E0712Q9lit
 xxZmen0uqN1EsY0jBce1P3LjpQ59XtAH7XTMxxj4yiQmSIPgdaznmrqC0JZ6BGCVAZYToc+fGOK
 HoUTdBv2s1I78sIRdacdm0zi9XTwvbGuctb1VGgwI8u3WOYAjrEKVg9jrAOTI2lzjnvU6uj2V4A
 wLK2aSHNsnusNAQJjWy90qgCp/xPPk9c4vd/u6A2rfaITq7oIwwBlmJNWGhBnjdDh2fTIu7w0hC
 EFlucqqdtARVPkA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Some additional register writes are required when hotplugging CPUs
on gs101, without these the system hangs when hotplugging.

Specifically a CPU_INFORM register needs to be programmed with
a hint value which is used by the EL3 firmware (el3mon) and the
pmu-intr-gen registers need to be programmed.

With this patch applied, and corresponding DT update CPU hotplug
now works as expected. e.g.

echo 0 > /sys/devices/system/cpu/cpu6/online
echo 1 > /sys/devices/system/cpu/cpu6/online

Note: to maintain compatibility with older DTs that didn't specify
pmu-intr-gen phandle only a warning is issued if the syscon can't
be obtained.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---

Changes since v1:
* Use BIT macro (Kryzstof)
* Use gs101_ prefix for cpuhp functions (Kryzstof)
* Model pmuintrgen SFR region as it's own syscon (Kryzstof)
* Use regmap_update_bits() API (Kryzstof)
* Program hint on current processor number (Peter)
---
 drivers/soc/samsung/exynos-pmu.c            | 80 ++++++++++++++++++++++++++++-
 drivers/soc/samsung/exynos-pmu.h            |  1 +
 include/linux/soc/samsung/exynos-regs-pmu.h | 11 ++++
 3 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index c40313886a012304b3f345d5d7369f15713eb857..41955ec2ccdb955b2d0b969651fad1a344628f1b 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -7,6 +7,7 @@
 
 #include <linux/array_size.h>
 #include <linux/arm-smccc.h>
+#include <linux/cpuhotplug.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/mfd/core.h>
@@ -33,6 +34,7 @@ struct exynos_pmu_context {
 	struct device *dev;
 	const struct exynos_pmu_data *pmu_data;
 	struct regmap *pmureg;
+	struct regmap *pmuintrgen;
 };
 
 void __iomem *pmu_base_addr;
@@ -222,7 +224,8 @@ static const struct regmap_config regmap_smccfg = {
 };
 
 static const struct exynos_pmu_data gs101_pmu_data = {
-	.pmu_secure = true
+	.pmu_secure = true,
+	.pmu_cpuhp = true,
 };
 
 /*
@@ -326,6 +329,60 @@ struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
 
+/*
+ * CPU_INFORM register hint values which are used by
+ * EL3 firmware (el3mon).
+ */
+#define CPU_INFORM_CLEAR	0
+#define CPU_INFORM_C2		1
+
+static int gs101_cpuhp_pmu_online(unsigned int cpu)
+{
+
+	unsigned int cpuhint = smp_processor_id();
+	u32 reg, mask;
+
+	/* clear cpu inform hint */
+	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
+		     CPU_INFORM_CLEAR);
+
+	mask = BIT(cpu);
+
+	regmap_update_bits(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_ENABLE,
+			   mask, (0 << cpu));
+
+	regmap_read(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_UPEND, &reg);
+
+	regmap_write(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_CLEAR,
+		     reg & mask);
+
+	return 0;
+}
+
+static int gs101_cpuhp_pmu_offline(unsigned int cpu)
+{
+	u32 reg, mask;
+	unsigned int cpuhint = smp_processor_id();
+
+	/* set cpu inform hint */
+	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
+		     CPU_INFORM_C2);
+
+	mask = BIT(cpu);
+	regmap_update_bits(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_ENABLE,
+			   mask, BIT(cpu));
+
+	regmap_read(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_UPEND, &reg);
+	regmap_write(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_CLEAR,
+		     reg & mask);
+
+	mask = (BIT(cpu+8));
+	regmap_read(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_UPEND, &reg);
+	regmap_write(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_CLEAR,
+		     reg & mask);
+	return 0;
+}
+
 static int exynos_pmu_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -378,6 +435,27 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 	pmu_context->pmureg = regmap;
 	pmu_context->dev = dev;
 
+	if (pmu_context->pmu_data && pmu_context->pmu_data->pmu_cpuhp) {
+
+		pmu_context->pmuintrgen = syscon_regmap_lookup_by_phandle(dev->of_node,
+							"google,pmu-intr-gen-syscon");
+		if (IS_ERR(pmu_context->pmuintrgen)) {
+			/*
+			 * To maintain support for older DTs that didn't specify syscon phandle
+			 * just issue a warning rather than fail to probe.
+			 */
+			dev_warn(&pdev->dev, "pmu-intr-gen syscon unavailable\n");
+		} else {
+			cpuhp_setup_state(CPUHP_BP_PREPARE_DYN,
+					"soc/exynos-pmu:prepare",
+					gs101_cpuhp_pmu_online, NULL);
+
+			cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+					"soc/exynos-pmu:online",
+					NULL, gs101_cpuhp_pmu_offline);
+		}
+	}
+
 	if (pmu_context->pmu_data && pmu_context->pmu_data->pmu_init)
 		pmu_context->pmu_data->pmu_init();
 
diff --git a/drivers/soc/samsung/exynos-pmu.h b/drivers/soc/samsung/exynos-pmu.h
index 0a49a2c9a08ef5bc75670551bdbf6d0a2d3e8ae9..0938bb4fe15f439e2d8bddeec51b6077e79a7e84 100644
--- a/drivers/soc/samsung/exynos-pmu.h
+++ b/drivers/soc/samsung/exynos-pmu.h
@@ -22,6 +22,7 @@ struct exynos_pmu_data {
 	const struct exynos_pmu_conf *pmu_config;
 	const struct exynos_pmu_conf *pmu_config_extra;
 	bool pmu_secure;
+	bool pmu_cpuhp;
 
 	void (*pmu_init)(void);
 	void (*powerdown_conf)(enum sys_powerdown);
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index cde299a85384a70d04dae49ee9a4e2daa88fbbf6..c82b40035e9fa8fe6a673b829a75a50a707afb1b 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -660,9 +660,20 @@
 #define EXYNOS5433_PAD_RETENTION_FSYSGENIO_OPTION		(0x32A8)
 
 /* For Tensor GS101 */
+/* PMU ALIVE */
 #define GS101_SYSIP_DAT0					(0x810)
+#define GS101_CPU0_INFORM					(0x860)
+#define GS101_CPU_INFORM(cpu)	\
+			(GS101_CPU0_INFORM + (cpu*4))
 #define GS101_SYSTEM_CONFIGURATION				(0x3A00)
 #define GS101_PHY_CTRL_USB20					(0x3EB0)
 #define GS101_PHY_CTRL_USBDP					(0x3EB4)
 
+/* PMU INTR GEN */
+#define GS101_GRP1_INTR_BID_UPEND				(0x0108)
+#define GS101_GRP1_INTR_BID_CLEAR				(0x010c)
+#define GS101_GRP2_INTR_BID_ENABLE				(0x0200)
+#define GS101_GRP2_INTR_BID_UPEND				(0x0208)
+#define GS101_GRP2_INTR_BID_CLEAR				(0x020c)
+
 #endif /* __LINUX_SOC_EXYNOS_REGS_PMU_H */

-- 
2.49.0.850.g28803427d3-goog

