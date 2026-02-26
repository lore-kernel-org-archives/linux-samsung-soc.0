Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E846B425CC9
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 15:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772120841; cv=none; b=sc/e52DZMHLP2asHFqEOcSO7IJhZ+StLt6IBJ5B4LMCvLF//ypl1RG31wGJyy2QXEgZcNzres4ii2nkaZ0u/mnXwRVvN+FjhQQY2BF3mAk18FauJH2UZrxPEYZUMHI5c44zhn8APy1r6ngxf0b7lEZkd1B1F9msOyOXPntU69Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772120841; c=relaxed/simple;
	bh=dQXpAN5o0ehB/7L1Q7jEKxLStCp6A4gPujkB8f3PCYQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AKrAmg8z6CpGfU/PDBhmgwsr/jQoKGZIbkY/9WaDdh9FgNo8GnXric62gctdvvDiGqOtIjfB5vA62bub89O1Jr0yV8r38JwVeeLJwSV7m2/R8gXyz5DTfOB5aGtDt4TgvttqharZBLEJBFhCgvs1qzTzShRPNAoX6CRUdPsr8EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zimCZc4S; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zimCZc4S"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso9186415e9.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 07:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772120835; x=1772725635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w4JELgxsFHw+6nBu+y8vI4aNbSoxJuvNiKsH4U80RpQ=;
        b=zimCZc4SPC62n/V3U48fdokMPVI8hQTofyrdxERfH85tVEs6b+fvbfeZmiHhyY5tv5
         Jvo4WH4kL8IQh2z9EXZRG8shAQwXPpgk3mEXI+NtGPkAaipKmkGv3THvPpTH9+dMQU9m
         J0u9CRrlkPVwXHpz9/Lkg8prU/CKGftMx69KQxgJPgnxK1+jS3BiODnCx66FVDGenTcJ
         1sJOlopo4StocHER9u0QwuW8foiUF/x33bqKYR5/Hsto6pAbJa8vXxtMreaj/aEtEEZ9
         EYPodYIzDcB5stb++Kv0evwMS6od7EP92jahO47BBfeDdrcIqIiK+7d8phMrAoc85rfR
         +cpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772120835; x=1772725635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w4JELgxsFHw+6nBu+y8vI4aNbSoxJuvNiKsH4U80RpQ=;
        b=Ic4fY1+l3tmiltzYXCQeudw1KiizF5QzqLGqpPIUXJWPyC1XZGj8dOk3kNrj9vekx0
         KbjaOPotZU6aAYxPBENgYQgNx0nzX3mrVBST2hQ4oM23iq1EpkSExLbPX23uAT0aTEHT
         nP+8tKE8dTnHG4oi04vWfEKB2rBsa0j8ws/o/3+9JsPMAxbmbJmfGtu9x7HX2YfGtF7G
         VFyFtbVFJAN5nkXCU1pYaUNDRx4AY7V3LLHB2xjgab2EMIp/qIuhon3EDbWQJoO+48Yt
         Ku/iIzKYAouGiecREIwYf/rVFIEq+50fpfoKaCOCBllzYF4YOWdTgS0AdAgTcEZuGrTs
         xuPA==
X-Forwarded-Encrypted: i=1; AJvYcCUHIPrkWJFl/CmRWQfEOT8mxFEBvkVbMqZ7hF3UZ2JwMp5I4wwBIundKMBELPkxLOgNBVfPZJFXy8Q+iGV2GlVCdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtfRi/sQ48AXCDzBzQ/N92g5iNrMbxSaxP6NdrmVbAzUL5k2C+
	c3I+a9PUUaVZVGxcGvzxiwEvBVelbVu++dsOY0YWU+HK9OuuFGtSTjRjLCCZfaBqfO4=
X-Gm-Gg: ATEYQzwKQrq83CzungxzLlcJhiOu5E7gy3x/kaTBEZbB+18cKZ3Cpxv4eNoAxQggz39
	Lotcqr+RTAf3p0sFxAwac/lLPx8/m3+GTSIV1l7/mABmAPj1lnEGlsz36fj91i0V/Mi9UGIo7hU
	Lji9Gno9qgBEoercG7pe1AFJT9kr1b+0aVU1jJsW21RNS5+5YRrzhYg4+LUzTioTnpyTwuta3bp
	Do6KBz8gjDN2Ks7ylHwV4RCbyVtDUaplUK8uIR7iMDPoG7SWfP3d6kkT/C8Xw4LX6l78P0S9XwH
	cgfcQWqMwjSj64QF+yLboXszBGuT8ZKD69tT4CeH84I9bi+BHMTlC6yGSRMa1xjm+xYKITPaYAd
	/3Etjz3xiZD5sJpDDms0Pbsf7C37y5EEu29+z4v2Kb/ThVflIyaQ0A97eVb8q09MrwKCVasLqmz
	atulkeLW7CbGYNszRaFNRD9T2MDXctVA4X18yQuWbryfjAkc7jqQ029Pqm86ZuPbCFf4h6DusCa
	IR3Bd60atPaxQyDWkkz7KfxOQ==
X-Received: by 2002:a05:600c:3516:b0:480:2521:4d92 with SMTP id 5b1f17b1804b1-483a96377c9mr346111365e9.24.1772120835139;
        Thu, 26 Feb 2026 07:47:15 -0800 (PST)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b4410bsm56007365e9.6.2026.02.26.07.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:47:14 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 26 Feb 2026 15:47:11 +0000
Subject: [PATCH RFC 5/8] soc: samsung: exynos-pmu: rename GS101_INTR_* regs
 to EXYNOS_INTR_*
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-exynos850-cpuhotplug-v1-5-71d7c4063382@linaro.org>
References: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
In-Reply-To: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

The PMU interrupt generation block is not exclusive to gs101 SoCs and
is present on few Exynos-based platforms. Rename registers of this
hardware block prefixed with GS101_INTR to be prefixed with EXYNOS_INTR.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/soc/samsung/exynos-pmu.c            | 16 ++++++++--------
 include/linux/soc/samsung/exynos-regs-pmu.h | 10 +++++-----
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index d58376c38179..92870e6ffc1c 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -244,12 +244,12 @@ static int __gs101_cpu_pmu_online(unsigned int cpu)
 
 	mask = BIT(cpu);
 
-	regmap_update_bits(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_ENABLE,
+	regmap_update_bits(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_ENABLE,
 			   mask, (0 << cpu));
 
-	regmap_read(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_UPEND, &reg);
+	regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_UPEND, &reg);
 
-	regmap_write(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_CLEAR,
+	regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_CLEAR,
 		     reg & mask);
 
 	return 0;
@@ -304,16 +304,16 @@ static int __gs101_cpu_pmu_offline(unsigned int cpu)
 		     CPU_INFORM_C2);
 
 	mask = BIT(cpu);
-	regmap_update_bits(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_ENABLE,
+	regmap_update_bits(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_ENABLE,
 			   mask, BIT(cpu));
 
-	regmap_read(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_UPEND, &reg);
-	regmap_write(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_CLEAR,
+	regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_UPEND, &reg);
+	regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_CLEAR,
 		     reg & mask);
 
 	mask = (BIT(cpu + 8));
-	regmap_read(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_UPEND, &reg);
-	regmap_write(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_CLEAR,
+	regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_UPEND, &reg);
+	regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_CLEAR,
 		     reg & mask);
 
 	return 0;
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index db8a7ca81080..9c4d3da41dbf 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -1009,11 +1009,11 @@
 #define GS101_PHY_CTRL_UFS                      0x3ec8
 
 /* PMU INTR GEN */
-#define GS101_GRP1_INTR_BID_UPEND				(0x0108)
-#define GS101_GRP1_INTR_BID_CLEAR				(0x010c)
-#define GS101_GRP2_INTR_BID_ENABLE				(0x0200)
-#define GS101_GRP2_INTR_BID_UPEND				(0x0208)
-#define GS101_GRP2_INTR_BID_CLEAR				(0x020c)
+#define EXYNOS_GRP1_INTR_BID_UPEND				(0x0108)
+#define EXYNOS_GRP1_INTR_BID_CLEAR				(0x010c)
+#define EXYNOS_GRP2_INTR_BID_ENABLE				(0x0200)
+#define EXYNOS_GRP2_INTR_BID_UPEND				(0x0208)
+#define EXYNOS_GRP2_INTR_BID_CLEAR				(0x020c)
 
 /* exynosautov920 */
 #define EXYNOSAUTOV920_PHY_CTRL_USB20				(0x0710)

-- 
2.51.0

