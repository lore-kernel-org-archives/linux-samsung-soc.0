Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740B529E07F
	for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Apr 2025 06:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745907591; cv=none; b=qgYdvpKXx78WLaHbZIxOQSkIyZ0Mjc4j7m4maIDlVpHJ9++K5lKTkV/lRpO4yKdH1rHzPp3Meb9Stvn4J8MvPSz0BU+xtsB8bQ7+n9Lpqooz2P4YyU0/UktUtVGchR+AGirzPaCxgQzvpHbYhoAIr6OML7iN1osrsHN6UvfeQzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745907591; c=relaxed/simple;
	bh=4lERTfOpiwQeYax1gfqq6qrY9EVnhKNheexOA0mzRzo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WgfNF7BxJ4EsvQLkRoR1VmwWfwb4hP/oke9hB4mUNk13jLxVUVK+ZhOohRswN0tGoD4cTun9aG6+NY3H96+74s5PEeYW4BRCpQP/2e3Bf2vAhdR94666FoUpcoAjgYw3MIfE4aIYf/A+yVJJrtd003DfSTCV22tXG4Uh+Gdf32w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tpbR4KVF; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tpbR4KVF"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so4169168f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2025 23:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745907588; x=1746512388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AvSL5A3NEbhnwLKxo5uX4gVOmn//DTx9o8Z+/6mMK9I=;
        b=tpbR4KVFtDgRFOreaM7QNiTBh3eGe1ZIX2BzZMQ8ngljwZm4EUYYr/g6HZnbd3/oFG
         HEBHaP177f/b1Y1bF1HJ+63ELCS/rv+OPgNqygLAqWiIBn8FNlVrzv8BqIWeESieAozq
         RicW6XkWTrfENw4cbfjaiHWW9tJ5q1ZQA/tnYmkHKZLY9ME8vsP8/rhSCwDDkNStCQ3/
         46FaAo8lfhbJcFT905ypDrOX/t4FPW1ZFVmripaqH/xc23jbAJwb7VZpzBWSLFWyyekr
         BHsjxsYtEJCySuBP2b0otib7C495h4pGQhuIDNubNIzyQwC639Qq9U8jgrU3I5lmG2cI
         2BPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745907588; x=1746512388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AvSL5A3NEbhnwLKxo5uX4gVOmn//DTx9o8Z+/6mMK9I=;
        b=mugW2zfbWw05LmjZO5ZmsmBhu6D4DYWVatHLsqKVWnWTM0kM+vuYEow6STfqJn7B7w
         zwrrYxgIr0IQL/8BkrBwLBblSSaV1tbmmO9ZCj/c/Q5N67cqgZrcw3lpW3CUXWsnNtl0
         t2pgEGWF44dwnFhJscqc0Q2oz1sWZ3akT2OegO7X2vZReRSsTBebPwXH16pJO/7XgHPl
         5UwWORMg18boT0GK6LXYllG9tbe68XdjKCWwS7ScGQoEAlWdYOJvkzxWO4frd/AuES8P
         D8qrkyyRC2MtomLE3EbmJcpIlQkZa2Xmfa/px6R6NpusGGQQa17uvQnlVwpcMZv5TWiD
         KGpw==
X-Forwarded-Encrypted: i=1; AJvYcCW+UwF6ueYL39dwtOUkardHB9chC09xYAqHOwmaPrtkDjw4hKecttt3vXtMFH8OFpEDCSdC2yBGngMhgT6c0n81bg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0qoA0zkLyfpyuHDqERUou2zDZtVb7H+xyfpKp2DTv/vqItqOi
	Am8uTPcBThZCLyXQt1uhOanMQuJhzQdDUXkDyoDwKt5u6/QrNaOCtaL/BxYhaTs=
X-Gm-Gg: ASbGncup8jIpjp5dXA0H6k/pMcw7ho+xLFTz7H0Yvuv710N+Y05fWLl9D/0oGWG2T18
	Xfa7GUFttwkd8PMNkcTAglrFjw3pWILsyEF0Xo75K+QCSAg8/L6wEBATuuqDLTAZD0s2CA6jsnw
	LVQOozyK2ubYsCqxFqhn9QjGfpaa7rRbZPI2z5nYWVlVFLSD/QKvI4jOUcx26vlvGihgiFZEwO2
	Kr0BcjdvjrzQ6xUPb6wsvpqUIlQ12GxuLfGn9bzrPk7VTFjZuUHN3cFnyFeCrtnXMfOkkXkC4f+
	oMCjZJfAg67Y2p2sImhaaiMtCCKEgHEleM/qT40rTvi9ZBzhyn4nwUp/QFf4cKxW2zaImkNhSQf
	Vfp74MA==
X-Google-Smtp-Source: AGHT+IEcKdG2wRSBuyM964cxTaQZshEIOKScbmwqkmDiGlGNlBV7TvAlb1MWRX0R+pVT/zg3VHmYyg==
X-Received: by 2002:a05:6000:b08:b0:391:253b:405d with SMTP id ffacd0b85a97d-3a08949feeamr1569115f8f.41.1745907587765;
        Mon, 28 Apr 2025 23:19:47 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.90.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca4e50sm13302616f8f.30.2025.04.28.23.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 23:19:47 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 29 Apr 2025 07:19:41 +0100
Subject: [PATCH v3 5/5] soc: samsung: exynos-pmu: enable CPU hotplug
 support for gs101
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-5-1bcc44fb1d55@linaro.org>
References: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-0-1bcc44fb1d55@linaro.org>
In-Reply-To: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-0-1bcc44fb1d55@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6366;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=4lERTfOpiwQeYax1gfqq6qrY9EVnhKNheexOA0mzRzo=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoEG99ncYW10Ircah1ax1HNpv/FjFikU/IRkMln
 bdyQiFvafyJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaBBvfQAKCRDO6LjWAjRy
 uos1D/9jmKnhe3CYlNEwh7yXAxDCImGNlTw6cTUunZUPcN2wZ9DIWuCRcKxKGuTnksOPcoFTWmp
 pyfIEO6irv/DPj8EqRwVINYRAOB+Nbfiei59d5xIQ5JbxszVSBtxLPWB48cLWxz51YX5MQvKggu
 oq3O5a+MvfdjJq7ziTwEPKNSZWDvWzFIdBqdzFZkZmrZR8hYqIIcKfogCbGr1Z8Z89ZJXZUAtJd
 felfmEdAieo/8ANqYyfbUNWiyOB9ltmmeE9a6vN+eJlkTMTCb4EAzPgT0RigCUWZcYe3Mx3OLDY
 IOVUADKvkmy5Lspe+5NloAfOMk6ykXiGkie35xyOMp1B2sg21ofViavTs4X3JCZqdlu7hnKwlcs
 WIh/MZCYkHPgK5LCowAq6aKlpr7VFfHcEZcuGQAYAMNP+s6VsdN7qVjt127tC9JYzpjg7TYBlEo
 DRPr4MHdfogDykdyxKDNsxvUxb8/xLhKHgNyZeWdPDeMH+k7y1XeAyZvSREaEzWbw/m5Ysh0C2w
 7go/XpGglUAF3wO6z7LJIhH9xsvlsR3B3uOQM8r++XIfTPbelascCioSbygRRIWezYPYa/aIGeS
 /DEppxx6uaDGQU9oLl1qw+KfEeoBqYC5xMyjaiNp3TLFsBSVPdX2zcA0zpWzOo/TUaNq31eSqXB
 on5R1JS4J634ycA==
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
2.49.0.901.g37484f566f-goog

