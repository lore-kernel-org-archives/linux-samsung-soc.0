Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5F01F1308
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Dec 2024 16:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734108326; cv=none; b=RIcLNZXUL4FRLzveI4fXna5Rm7Omv3t404a1VtJbcfYjtX268gy668GNsq20HfhkU0L3MBjJrcmkzwqoXrTRVVnNO5tZwaoICuFtgA+g208Y5YiE92ntwtEGMU4KwSkIyfwt2S2YAKYncnewuhyLmUgnRI5xKnSCOTL5OkLOml8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734108326; c=relaxed/simple;
	bh=Qzt6V7MPTnrrL8I4lVzjSwBYmRktc+/YgSPk/GCVFoM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=icjYSJMmoNe+2vAOsmXI54iftoRpJFlBl3l6w/3VrlSQG3qrXEIHK8AidlpR+vEQgn/dJRwjJd/j1DcfuPbot0jYyYb+j5nPgVT7t3jmO52HZr2NkRamsSCGOHM92Wvy5DimuRtsKQNAE/sWEIybzaj0SpLyG8Ct0MeT80RL9bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q9YgFjg3; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q9YgFjg3"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43628e97467so13265525e9.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Dec 2024 08:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734108322; x=1734713122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sM+OHiF90yvvBmEBEkw7PlxOYbfepKOCjoVyVikB5ho=;
        b=Q9YgFjg3iQTshsdTV8yEArHm8lQ6dCnY5W/XslWSWy03jSmZomL6Wl7rM1drnBUqon
         1OFvW+jkgdqJz+MmbQsg9cAnkUsQ1UwUL7aeHKoqfoN6rdZ4DsQa1dZq3XsMA75tCXOi
         bXnUey0+MJPpKAghnzJnREc2hy4UPE8SQqYMlCAtWl/ApPluER8oiUnwzJbxelWHw/PK
         H+DHfyc+PumDvCDIDoSZ2QFwjOUKJ6GHAJ/W8qVTwPpQiipNxOw3HGb2J7+X954QMQrk
         jpjzeIBCIamwdMkCVV3E54MEhSBMhCBGBUjHtcYX6k5P3EO5pqHGpPlkpLHPHtwpAzWo
         9Qvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734108322; x=1734713122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sM+OHiF90yvvBmEBEkw7PlxOYbfepKOCjoVyVikB5ho=;
        b=IINKD6tG4+mwammSinTKVBkeuSZnbity45dYa55RqO4Fvrj0y9IfoUmdvARalJPtRK
         4xRdlyNK9cP4NoF40f3dPfPQvHrQ+sLqKi0u6BeqXHwsQULHhacvslkPAbPZEnanl7Gu
         Y9jtEuYZHY9TIRc3Callak0x2iXd1PrxaYEXMWnMuMLeNxEgphGChUaRyLqGTDvRlQos
         kjA+l15HK9x6RCJAK1qHXPxur7lB4pdLVFxz6psRI1bIdTgSc0FXVw/5uylzRbP4rjT0
         KYJA2DURc9DNTB5/7Y+0kXBp6mUdDe7jPKsCPsnXIjCJ2+Fovp+TUSFmbLGiAba1UdGN
         YYhg==
X-Forwarded-Encrypted: i=1; AJvYcCUNCmoqfXzCqIuG1z9yJWD0UGRdCCmynGRFxdBb03wNjQZIo+utx82FjFHMeXrnkkGEbaHEQjCRXZbToxjXHIgEZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5aHfPFnfEaImJWgdKDNyEb8ryEe3UhO245p0vUjIfAQcr1AdE
	Hm4EVxtefJMMw0qg+tcZuLr9Pw6+nVLFgVKli6GDmVj0h/qMeJgnyQdU9w2L6FQ=
X-Gm-Gg: ASbGncs4MyWZB4OuRscOBAm5TnwVtxkd8drWuX+kXQoUppAXCStHQ4aP+xytLvOXnpy
	RyOc/kAmGALa6q16835n5fGvXbtYZuWkIrNR2Mmzr/KPEEbxWtXncrGl5lBHfoap4WrEbDe/1Ev
	aeH01NplChnzCv4ExM3vr10jfYIOWcjmrgm/xM8xU7FKa6Y6IV2EKi33V1TlDIKC3QEhHJlBPJ7
	UcTBWeu8X8MfOx6Pr1T8vkL8HpuAm7iGon4PTbsSKRqloRT0y/f3qikGfZx4juTV5JRshUEboz6
	pY81h5JwMQ==
X-Google-Smtp-Source: AGHT+IEwmLAcTh89DX5T/LSijU8z8bvHD+aN33QJxTOiFr0brRxcpM8yH/x7cknLvAOziYYAxWsdSg==
X-Received: by 2002:a05:600c:b95:b0:434:a0bf:98ea with SMTP id 5b1f17b1804b1-4362aa2e5ffmr33344465e9.9.1734108322380;
        Fri, 13 Dec 2024 08:45:22 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625550523sm53900665e9.7.2024.12.13.08.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 08:45:22 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Dec 2024 16:44:41 +0000
Subject: [PATCH 4/4] soc: samsung: exynos-pmu: enable CPU hotplug support
 for gs101
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-4-c72978f63713@linaro.org>
References: <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-0-c72978f63713@linaro.org>
In-Reply-To: <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-0-c72978f63713@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5667;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=Qzt6V7MPTnrrL8I4lVzjSwBYmRktc+/YgSPk/GCVFoM=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBnXGSarmzwM1kbdivF8IkWxg2Uc0310r8V7M0Y7
 F9SFeH1J0SJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ1xkmgAKCRDO6LjWAjRy
 uoG8D/9bBAX5wVe3H5FgKq4xkyJL342x5fcHH0eUNITx4oEvi85oYZbJcJWP3iB46a3KONBjUj7
 dCXDBmtd9AetZ0yLookvweoWbgIqfI/+KUHhDlkA1vSeFJ4ejXs4RvL7t/idl8y++7RMTxh+vhZ
 jbGfrge5R7JfmXvtBUv+lktbLMPes7SOiWJup6x8yCtJq8LyasCPXiUboWeL6NXkMNnGQqGLvi0
 MDWdaa3dP56lRP6fXUNnQ4Tc/8Tm/YkNcHZ3GlHT5b7qpIcEPOx7M/+d0Yt/1+uKqYc4MIMXCIT
 2ALjVMttEirUpAoYMHcY8WkmxYUSTLMm2scK5q8TPAEJO/JmX5AAk543cQASubnBzqWh/xLClcF
 iQ6QH9wyJk28grdgFIy0oLMWSWz0FiwD5vjwlYpedOskNG/KZw8jxTm2RFmVp43ynUreKmdE7RJ
 S/S79VW/C7gTDViP9gFXJM2+initDuXXUXk3Aacq5fMA27jJUX8DeC95Aaaz1hC/bkk3J92uv8+
 Xw4gxJU9Fum16kGj535EayF1lxdF36fxxfL6hb+fMhUXcUXi93MiXmzvFAEEbmFBoXwwnMBTeHm
 gJ8x/iIlzeFU0LxlKXNbOp77LHxhzoQ13+goTOzYoqS8/s2677uc4Xlh8AZuogv0bmqQ0Ydaewl
 zqg+w0ooJRexZ4g==
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
pmu-intr-gen register region only a warning is issued if the
registers can't be mapped, and the old behaviour is maintained.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/soc/samsung/exynos-pmu.c            | 73 ++++++++++++++++++++++++++++-
 drivers/soc/samsung/exynos-pmu.h            |  1 +
 include/linux/soc/samsung/exynos-regs-pmu.h | 11 +++++
 3 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index d8c53cec7f37..68eb4eb3813b 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -6,6 +6,7 @@
 // Exynos - CPU PMU(Power Management Unit) support
 
 #include <linux/arm-smccc.h>
+#include <linux/cpuhotplug.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/mfd/core.h>
@@ -32,6 +33,7 @@ struct exynos_pmu_context {
 	struct device *dev;
 	const struct exynos_pmu_data *pmu_data;
 	struct regmap *pmureg;
+	void __iomem *pmuintrgen_base;
 };
 
 void __iomem *pmu_base_addr;
@@ -221,7 +223,8 @@ static const struct regmap_config regmap_smccfg = {
 };
 
 static const struct exynos_pmu_data gs101_pmu_data = {
-	.pmu_secure = true
+	.pmu_secure = true,
+	.pmu_cpuhp = true,
 };
 
 /*
@@ -325,6 +328,52 @@ struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
 
+/*
+ * CPU_INFORM register hint values which are used by
+ * EL3 firmware (el3mon).
+ */
+#define CPU_INFORM_CLEAR	0
+#define CPU_INFORM_C2		1
+
+static int cpuhp_pmu_online(unsigned int cpu)
+{
+	void __iomem *base = pmu_context->pmuintrgen_base;
+	u32 reg;
+	u32 mask;
+
+	/* clear cpu inform hint */
+	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpu),
+		     CPU_INFORM_CLEAR);
+
+	mask = (1 << cpu);
+
+	writel(((0 << cpu) & mask), base + GS101_GRP2_INTR_BID_ENABLE);
+
+	reg = readl(base + GS101_GRP2_INTR_BID_UPEND) & mask;
+	writel(reg & mask, base + GS101_GRP2_INTR_BID_CLEAR);
+
+	return 0;
+}
+
+static int cpuhp_pmu_offline(unsigned int cpu)
+{
+	void __iomem *base = pmu_context->pmuintrgen_base;
+	u32 reg, mask;
+
+	/* set cpu inform hint */
+	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpu),
+		     CPU_INFORM_C2);
+
+	writel((1 << cpu), base + GS101_GRP2_INTR_BID_ENABLE);
+
+	mask = ((1 << cpu) | (1 << (cpu+8)));
+
+	reg = readl(base + GS101_GRP1_INTR_BID_UPEND) & mask;
+	writel(reg & mask, base + GS101_GRP1_INTR_BID_CLEAR);
+
+	return 0;
+}
+
 static int exynos_pmu_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -377,6 +426,28 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 	pmu_context->pmureg = regmap;
 	pmu_context->dev = dev;
 
+	if (pmu_context->pmu_data && pmu_context->pmu_data->pmu_cpuhp) {
+
+		pmu_context->pmuintrgen_base =
+			devm_platform_ioremap_resource_byname(pdev, "pmu-intr-gen");
+		/*
+		 * To maintain support for older DTs that didn't specify pmu-intr-gen
+		 * register region, just issue a warning rather than fail to probe.
+		 */
+		if (IS_ERR(pmu_context->pmuintrgen_base)) {
+			dev_warn(&pdev->dev,
+				 "failed to map pmu-intr-gen registers\n");
+		} else {
+			cpuhp_setup_state(CPUHP_BP_PREPARE_DYN,
+					"soc/exynos-pmu:prepare",
+					cpuhp_pmu_online, NULL);
+
+			cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+					"soc/exynos-pmu:online",
+					NULL, cpuhp_pmu_offline);
+		}
+	}
+
 	if (pmu_context->pmu_data && pmu_context->pmu_data->pmu_init)
 		pmu_context->pmu_data->pmu_init();
 
diff --git a/drivers/soc/samsung/exynos-pmu.h b/drivers/soc/samsung/exynos-pmu.h
index 0a49a2c9a08e..0938bb4fe15f 100644
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
index ce1a3790d6fb..0d5a17ea8fb8 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -658,9 +658,20 @@
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
2.47.1.613.gc27f4b7a9f-goog

