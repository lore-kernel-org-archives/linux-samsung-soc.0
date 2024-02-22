Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82EE23747
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Feb 2024 03:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708570972; cv=none; b=MAXZk6E8DaFjuA6pM2DKh5igpWpdZTB1usZCra5hSgDsALw+6IJVxLMRaX2cNipdSiq2sK02yhNj0W9TYsz0+SHoVUeMHFQuM+4aZ98jlPYMmsdR8TMBEZpRzZmoMAhILfip644Yht1tDfdtSxMwOSxwBoAx/S+mknhovOB4ijM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708570972; c=relaxed/simple;
	bh=Llmts9er0YO12okZvDKZ3o7U9Ne08vcPhXCSWiCXxzg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cQm6zyLQFs9lYWIHutOxllArBXMYSbhXpk0GoJU22mVUs1snlP7bw7h5SLr2AR/y8DlyTK33MaykK1u5DIdzWqPNK2XkmgaUuLgl54bCcGR1BL3DXmuNl55dKJsc3BeHWGDL3eUeiJBsKl++fSr6CZTWdVeL63jY4cYMMo5yxnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OEdOwaDZ; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OEdOwaDZ"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3c167d33fcbso656468b6e.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Feb 2024 19:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708570968; x=1709175768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=grJN+AzJeONYxPFqwVKM9Uij+OT9i/pLW+mGEwKkNHk=;
        b=OEdOwaDZEyzv3jCpS1Aj7LPzyHni8izsPie0M4uXcQNTMmTQQsG+tkEKPWaPaDJ2g2
         HwR6l5ev9xDmrmdkG8FEJ2EDIQRmFi5N5DS7ml8XNjPkSt+pn5S4d/BR0aGXuVHv48iP
         dLrjOhAO1lPCTb4+2Q1IudQlQNyVxdI72vnLsjke53Ez6eRywElliKwgT3nTJwhIm/Yw
         ySQTjoB5fScB9ujfKecJFV9lGgJX+PQlgBKO2Cbj9MSY/LnMO3brt2JdnHAZyWlQSnZq
         fbMCtbbPsgb42q2Ligj7eWFgsJsKrf4IKXlpTM8UPh1gjT8A/txaYzI3KMDHNjkkNFPu
         nErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708570968; x=1709175768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=grJN+AzJeONYxPFqwVKM9Uij+OT9i/pLW+mGEwKkNHk=;
        b=amt0xxrY+QtrS6l9gDQ0iaLZI4jRWmD9nFJhDDe2pIUErrx4klvcPBHIy4bs7hhZ+L
         0UFwTnU5X6EgxoqGw32Ghk/nGF335C2k+59RrlUWJioJ8pSf9WHHAvAIxqFQ7B8g3neZ
         pYFkyPgc7GAAAhTu9UHI4Yj+AMQBMFbEhwnH8VfRI1v3OIMA4ZgZYgl99v6dQiMJ3/9B
         /NfsQBu5Jf0fMiHOOjp7AWBX0L21p/jfUcSg1hcOF+d0Z/Qy8MogA1WPe8ibns/fDFhV
         U+rG1HaKspAXjbKKMAUyOZeftz47kJiIL50e6TKNILCdnmMnlspntEuL0z4BELfgROwY
         1a5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUcsJP6Uj4iyKojXDvAKhAjTMbALVo0vdcPwNxqSLBNe1Ws32udZEEaIgbZPP7tDJ/NSyc8GPKhQUUJCKaujnlsIsq6fNAgebGkoksNStoRAdI=
X-Gm-Message-State: AOJu0YwUc7hKB/V8bYailA/BQjNR9KwiSEmtXqA+6oUA5W8e173WAtiJ
	UDAw5xo8ykoDGpIQ1SeXCuKoVW/FSoSOkEXyxMjGYFYFDFWPgX9YbJzm7jrpz/k=
X-Google-Smtp-Source: AGHT+IHrF5e0wG7OyXIrS2TJJWIdex+esm8ZSi5i1AGtQTA2hm3QzTV/2zJRMkDX0FoZBhRVH6mnVw==
X-Received: by 2002:a05:6808:30a6:b0:3c1:6008:1c64 with SMTP id bl38-20020a05680830a600b003c160081c64mr10012978oib.54.1708570968752;
        Wed, 21 Feb 2024 19:02:48 -0800 (PST)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id u19-20020a056808001300b003c14520c78csm1794653oic.54.2024.02.21.19.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 19:02:48 -0800 (PST)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 15/15] arm64: dts: exynos: Add CPU clocks for Exynos850
Date: Wed, 21 Feb 2024 21:02:35 -0600
Message-Id: <20240222030235.27815-16-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240222030235.27815-1-semen.protsenko@linaro.org>
References: <20240222030235.27815-1-semen.protsenko@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define CPU cluster 0 and CPU cluster 1 CMUs, which generate CPU clocks,
and add corresponding CPU clocks to CPU nodes.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - Add "for Exynos850" part to the commit title

 arch/arm64/boot/dts/exynos/exynos850.dtsi | 26 +++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 2ba67c3d0681..0706c8534ceb 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -93,6 +93,8 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0>;
 			enable-method = "psci";
+			clocks = <&cmu_cpucl0 CLK_CLUSTER0_SCLK>;
+			clock-names = "cluster0_clk";
 		};
 		cpu1: cpu@1 {
 			device_type = "cpu";
@@ -117,6 +119,8 @@ cpu4: cpu@100 {
 			compatible = "arm,cortex-a55";
 			reg = <0x100>;
 			enable-method = "psci";
+			clocks = <&cmu_cpucl1 CLK_CLUSTER1_SCLK>;
+			clock-names = "cluster1_clk";
 		};
 		cpu5: cpu@101 {
 			device_type = "cpu";
@@ -254,6 +258,28 @@ cmu_peri: clock-controller@10030000 {
 				      "dout_peri_uart", "dout_peri_ip";
 		};
 
+		cmu_cpucl1: clock-controller@10800000 {
+			compatible = "samsung,exynos850-cmu-cpucl1";
+			reg = <0x10800000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>, <&cmu_top CLK_DOUT_CPUCL1_SWITCH>,
+				 <&cmu_top CLK_DOUT_CPUCL1_DBG>;
+			clock-names = "oscclk", "dout_cpucl1_switch",
+				      "dout_cpucl1_dbg";
+		};
+
+		cmu_cpucl0: clock-controller@10900000 {
+			compatible = "samsung,exynos850-cmu-cpucl0";
+			reg = <0x10900000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>, <&cmu_top CLK_DOUT_CPUCL0_SWITCH>,
+				 <&cmu_top CLK_DOUT_CPUCL0_DBG>;
+			clock-names = "oscclk", "dout_cpucl0_switch",
+				      "dout_cpucl0_dbg";
+		};
+
 		cmu_g3d: clock-controller@11400000 {
 			compatible = "samsung,exynos850-cmu-g3d";
 			reg = <0x11400000 0x8000>;
-- 
2.39.2

