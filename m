Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDB01DED52
	for <linux-samsung-soc@vger.kernel.org>; Tue,  6 May 2025 20:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746565070; cv=none; b=iuRQRL7Re8BW2DdeQqWXOhocVafkVdtB+RHQ3Gp+RMh2hWox3bdeU0JFkbdbgK+MddFZ9KO7j1r3LOxlkwBhupbXgTesUwaZVFAvNTgCkl0lEI8bYrBMQ2a9MJceZegf+23GUYlzhx6GpFkn0m1cKCOPIMUXMS/2A5NaUinGtZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746565070; c=relaxed/simple;
	bh=DmhgKVwxaPjv1roKDXteW3FTL4oH33qlI5LJtEP83bI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KB9hKBRI/wStmmt9EzMRhYOQUzFlRmFRi8Mu/LOogcCgojEQhKuDXlZeProgxUIvI6CKZOHfUSopmQ5UcIP+cxNEa2jny65I1nDeKbJ6wgXL+4gtKsEhwqfeM9Gr0kFSdUrCdO8/RuCsibP/FKBUschGsB0AmnqIIFxxBQ+oW1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xpN0qUZM; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xpN0qUZM"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so4579963f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 May 2025 13:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746565065; x=1747169865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rHRlpPPsSJqGzltMuOf+ZTof6Jgch8QpoTOiopbtkF4=;
        b=xpN0qUZMsmW+V1s31q+TbUxPoGS19xW8M32DfhXAHIMjCFCb+FsL3qbYXvtcEm+vAW
         w/cKG3exNRt1n9tkfWy7i+prRRhlXQCluyH83EzEKZ+2oOiDFRt7+ukoP9WuTdWqp+Yh
         67Kk9OkBngqlEebWSDIZE9QaiJXEWeQYIRqbWI3RwiXUkIPkR/zRssfymiiMK8SCdWi7
         4HcMOOxJCy/umCQG5utEjidtSi4ajF6aCtTeBhjpmwoEagCqleXhE/IgOK9QB2y49QYI
         yqZ4/W7pQHCFWdyR5MV1GD7vsICgZK0abOu8nY0dAqubI9j+wzmRHGr55ttQN/EJ+nB0
         xjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746565065; x=1747169865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rHRlpPPsSJqGzltMuOf+ZTof6Jgch8QpoTOiopbtkF4=;
        b=AMSCYTDHXDYCb0XQMZqzIp2LydPUKklYaNun/k/QuJI+Zc08LPV9W5FSeSim4H1VO2
         N7QzRbabdZpjZkQa96n4BHZCQsqe8puU0pGggq7+eQmwkBBU5Y4LD08nhlDknnWdqv2r
         WJUnE9oq/ggQzHO/j0dBLFACFcsA0jusr1YxYY/BOCx4XPYDVmfqr5+WTDQgmNsmrAIB
         ClcNjlG+x2nBNvNcrbLZXi1STwEGnJ0NXQeIlqhX8DBT2FEn/ZFm5PHS/bkzmLGxJaGe
         HhkrPVPnUgt8yAZWrLgJBQnkuWcbO0Mae9vnCbnHs2XeBrJNS0UwMz4OlJRszdya334C
         dMQA==
X-Forwarded-Encrypted: i=1; AJvYcCWGhFQM7KyD4qQKDe9o0U0v5dzumwE1wuDydqreQ+U97TwV1nsO4KJVretGIKmtxf7nX1FK9vX8JfLlKtbg+joo3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2exGthw60NHNq5koWfII1nGRxHvNy03JgV0YyU8qPygqC7qX3
	TDsjy7Kg3br9TlnXJGLvigwWFX4yiY5g1oe+Tq3PXvF6zlL3dwGhv+iKmqKJNLY=
X-Gm-Gg: ASbGncv/SQgFPmRwpsynfRCFARMdru0+IDHMegVxczfjD+xsvYb6VmJLM/fWBCOwaZN
	E2cdrPj1+8aE1AjXyHkHMZkK8+Qt2XOau2/pcuSSNnOgdVemSlWfhxl0oL3ayXmlPkLavZfeuUA
	6842NOLOqN5nEKuV0zQhrTsCBZcaInhjqcGDvtW0RtQMyEnHEwJfPiTRXfxOvvjrXm20wwYPLxe
	V7uzvvoFTrLMGYzCqJxH7PABRdquXNFRth5P/lwZJH8C/B2mIfM7CArWrDl9DDTvhAR1c7ipL2v
	KPXnOvcxgEWeAXTm9J/wYsUFtD9JzyadhQdMZSMfocUitHP2XESd04+GiHVEGV4LUmbn4pU=
X-Google-Smtp-Source: AGHT+IGulLrYWlG+kZCMXnnKSTODIHE+4aud4nyijHDirTc+a1jg1d1OEehyINhIG/PQqFXnGWHJpg==
X-Received: by 2002:a05:6000:4310:b0:391:22e2:cd21 with SMTP id ffacd0b85a97d-3a0b4a0554emr651550f8f.36.1746565065379;
        Tue, 06 May 2025 13:57:45 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17022sm14671826f8f.89.2025.05.06.13.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 13:57:44 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 06 May 2025 21:57:31 +0100
Subject: [PATCH v4 5/5] soc: samsung: exynos-pmu: enable CPU hotplug
 support for gs101
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-5-9f64a2657316@linaro.org>
References: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-0-9f64a2657316@linaro.org>
In-Reply-To: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-0-9f64a2657316@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6461;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=DmhgKVwxaPjv1roKDXteW3FTL4oH33qlI5LJtEP83bI=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoGne/lbKw4I26t2kad3YPe6N0+D1U9nwWjSbiV
 qxfSIyClViJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaBp3vwAKCRDO6LjWAjRy
 uvkwD/40C6kd/hz8G7/BRCna/loJnrlliDpXug9hRYnua7k0DIzUhdhVt6G5eWj5vbfW026Vel9
 yi76dDm9N4DsM9VxevSVpl3qaUr3Q21qF7Tvl06e/EtiBLKJUwas3SLgiwaGo90dlsyECKjYjYE
 FNvdOu5u3ep+ZE5r2XrPiEVeyONHR1Jrc25AW0Au6lokRTQoVPNZXx4R1I0iWAAM8Uu7lVyhmal
 Kps/mBJZSBesMIcZnUR0IYgIgmLUccqlmXEPcS8E2OmmcN0hdKSY8jHcdYFqmKID/X78Wx4Jp+y
 +QPkpBTIfREDs22QEeKfYIz+EJmRSfOSpgmCB+t556edtpWW9Zhi/Cu/DTMVuZVMAM81XbgbP07
 eG+rGtanTx2ezj3ZGpHcTkRMzjn7E5UiCQ9RQL8RB0lA3Ra8CnkXw0kQTa+m1FybTzn1lrxMstL
 ko0FZ2rMoUuEj+eMG5XaVoIsLAqxsbF3TtJhv8atgDEcqchqxmIENWV8CptTcii0zogpF9AdGlN
 8cBbG9VePfp8tx3nb+Q40eZPwtQTrVzTMrrcVj8P1Xi6cHTqef290wsFTV4sBQn8LOZqYzPeFaZ
 JbgC3J0ZJIDgKGOO2/HAYe8h1ZNsMOQNJQskzv4J7hYOlnAS3dgA7xnLOhjzxALWcG6MRj1TtEo
 BbBnvwlnAiPhGjw==
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

Changes in v4:
* Fix typo with GS101_GRP1_INTR_BID_CLEAR in gs101_cpuhp_pmu_offline() (Peter)

Changes in v2:
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
index c40313886a012304b3f345d5d7369f15713eb857..0915b2457be7f473f09b6030923ba80c2f963427 100644
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
+	regmap_write(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_CLEAR,
+		     reg & mask);
+
+	mask = (BIT(cpu+8));
+	regmap_read(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_UPEND, &reg);
+	regmap_write(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_CLEAR,
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
2.49.0.967.g6a0df3ecc3-goog

