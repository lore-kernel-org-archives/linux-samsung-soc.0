Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826BB242D62
	for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Sep 2026 03:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651467; cv=none; b=T6taRjO1itwxaZbDBrHld7+J4EizU32MBLmpbyPbsYhVL7iM/Dw/ZvEKFWR9ZRqySOWJOnDbapIzcXD4E4M+L0phvVnmGJEmFhtkw198RurrL1lyGaqWQuJTV313tNannXmtFFKynCWtcnMDE1xtc/FOVwdkSytnx+wcoBUpgJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651467; c=relaxed/simple;
	bh=Hgfr5cIDes5lF6RJSfHTZiD9fCb8BoSIwwoCRMm+R4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QWAm7eR4I79FgllXcHy1up/Y6coqLmKYgy4nHiNmtq7q9ZWN+apEjUnW4Dnk4AAcH4rJxnE37+RJ3pKWlJ13ssHtDgFpASt844OvNkfxeH9t8Nw1xN0LZ5F7UA1wGGz5P5bNsQ8O+/4dTrA6ZYUzyOtDYw9Rb94FaG+QvjLiE3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bdMjPXn+; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bdMjPXn+"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso12628405e9.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Sep 2026 20:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790651460; x=1791256260; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Tmkp/C41+VRZ67CctHDbpVV8IlGaj/VN6M2tb1CRsw=;
        b=bdMjPXn+VnYNgb3V/Hd80lVGYJkoyRqXGiXDBYr/7sfLWq8TVW4Cbn9BWjFjRWKtR1
         fnHR+5TD+EVwxhnQNGalH0tsmASfKQRNJDYTBINtxIWPwLuR2VNPdCFzEnWvb0tswotE
         OSR8gPBD/bznRPgS48FrVo0kIM1PM+m07jIdOteOQzEh5YRAXKnSH3SBapep5Kqn+ViH
         sOtXmByXA0JETiNyfLznUsSssDm03cFPG3JHfJeSkbYunR3Y3u+v6gHQDtSunJpPOjsF
         j3Lz7JWegoTZl9zfnXCmXGZDVl0SfYeM1HY9ATvYn5lFJDJ7VzPI0ksjjY+w7ySNhaeT
         f/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651460; x=1791256260;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Tmkp/C41+VRZ67CctHDbpVV8IlGaj/VN6M2tb1CRsw=;
        b=QP6KJ0HJxwvBcF6M5AUuTd/oKFXpjeyvn7rs4U2cfAsh422unwrB5aa7HM0Deajxor
         u4zYeHozHTqaitc4yUgQ+H9Qjd6ISgOYDikMlttIk9eqIrDDaRx49nRxHchHh3e5bKkQ
         UK8zQ+MBznOLiO/R+itmK/6JM5rGrgrhLDvZigSsk8hyK6zK2i0l3y4nXFkGZnnFTqtP
         +EfG4DFuibBVrcPoh23beRGM2JMshwZCuyW708UpHsX0FtrJpj1vjEM+zxA8gK50LVp5
         I7Uwt1VCz2cAoRn8wDYIS4DhPc+bBJCMRMWfzQTsRWlkSLB+CU2Z2QMjMJO/81a+FsMw
         sPEQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7DL9IZZr38qp5J+ZQqL8ZMroHm77qgpDaHjRCqwTex78DDfSg2dI6yaI6Wys31qqXEofN7GrWsxjrjZVatKPXbA==@vger.kernel.org
X-Gm-Message-State: AFuF++k2bzSsvmVkY6dIy6B7ZFbwno45znl/BfYLt9FhwxaBIuVvMSpA
	s/pKMNtF3cErIt5iUidtE5EzyCuKAV25pJVzw4HxJ+kN1z/rl15JbcGd6yKkGtjCX6A=
X-Gm-Gg: AYBFou2ia1MpxaJDOBscc1XoiBvanaploRS+4L1F0qp3RpBl6gZ7CSxgfuiC2J3H/8s
	25P2SgGhHOn81cvr3Q+vzL2P46zwalkAkDvcVtDAaEf/C2ObE73yK+Xm6ewxHmvesURJ41i2YBQ
	sTt/FBbV9xDMebVgSAvg0FS+XByMEDp6aiHevyeNqlbJ0cOghnHT6N7z8Wu4vilgiTUmGEPDTT4
	mxFDd+umVzzB1XHF8eYbUsz1fqqNMKdGLa5wFW+ajEMtW1DXG7qVQhpZnJAyo/OrHeLQ1fFWOF7
	piHuBXTs+47vpyBpQVUKDgOdtO5rZpHAE/PnAHioBPuo6To+obBnixRaQAS3IkjdM5HCGxg94nx
	mgccY3w51xvz5PuXRldCXsmvkgJvq6tBl51eqAbJGhdfiDttl7z4kgqn3ZHUNw/yznRC6LPN/ET
	nooaGgD+Hn280W+ppZBlQmI5JxpAwBcDTaYoFY6U5lqo6O1kVFGE2q9hBcbIJU3SIIN7jBNT82p
	htugtA6jdDZX4kqBhZBAFP376zrOIZxYFOoJSBF1jOKu2m/7y735GMsmTaEOsQ=
X-Received: by 2002:a05:600c:8b6c:b0:49f:ffd0:9a9a with SMTP id 5b1f17b1804b1-49fffd09b09mr108686475e9.25.1790651460523;
        Mon, 28 Sep 2026 20:11:00 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfa66e5sm46706265e9.11.2026.09.28.20.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 20:11:00 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 29 Sep 2026 04:10:47 +0100
Subject: [PATCH 1/2] arm64: dts: exynos850: Add ACPM firmware node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-exynos850-acpm-node-cpufreq-v1-1-5a86c1d404b8@linaro.org>
References: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org>
In-Reply-To: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Thomas Turner <tturner@lineageos.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Add the ACPM firmware node with cpucl0 and cpucl1 clocks. ACPM firmware
protocol provides interface for all client drivers to actually use
features exposed by the APM co-processor.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 8a4771899a8e..91c6cee8f483 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -11,6 +11,7 @@
  */
 
 #include <dt-bindings/clock/exynos850.h>
+#include <dt-bindings/clock/samsung,exynos850-acpm.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/soc/samsung,exynos-usi.h>
 
@@ -170,6 +171,18 @@ timer: timer {
 		     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
+	firmware {
+		acpm_ipc: power-management {
+			compatible = "samsung,exynos850-acpm-ipc";
+			mboxes = <&ap2apm_mailbox>;
+			shmem = <&apm_sram>;
+			clocks = <&cmu_cpucl0 CLK_FOUT_CPUCL0_PLL>,
+				 <&cmu_cpucl1 CLK_FOUT_CPUCL1_PLL>;
+			clock-names = "cpucl0", "cpucl1";
+			#clock-cells = <1>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;

-- 
2.51.0

