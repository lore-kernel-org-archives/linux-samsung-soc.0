Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179534F883
	for <linux-samsung-soc@vger.kernel.org>; Sat, 24 Feb 2024 20:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708806069; cv=none; b=b6o6JwmLhEqCD1K85+3KtxFw5wfiHdFnhzzCXVh3xNdXTS1UF/CnY7WfRom9+6vBo5Ak81p88l7xvY70GWqFszXhpjBRYcbsnQDldvc0a4Ovjpypqi/RR0cAQSnOuIWY1W1XnaLDHe65dgbLMP6IbMlWIvhYz5kpEON9Uh++pKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708806069; c=relaxed/simple;
	bh=Mv0a3gOoxI7PWU3YTmYf9kqa0HHrZlHBLeIQmvrLoHo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qyr0qIkUl/WybjLjjmz1Udp6GrdGS1Nvy4OLdVK9JLiqNBOYIwbtYOTA5/d7r6BLL9B9+jeeLOZrsRGJ8EO6sTdYfCb7ASTp4pS5i42dKe51LuYupIkC0KjhBheZS+oMgY5xHFgk8qDyZyEIJsxVNVIWYWuH60FTlwRJxK7n2gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MJIcIsEU; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MJIcIsEU"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5a0797ac910so2581eaf.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 24 Feb 2024 12:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708806066; x=1709410866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qMCmyVuJ+YwjHrCIo4ko9XwoXKrRHcalREosYeHxNXc=;
        b=MJIcIsEU8pZIjGcDojuGsJDb19QAYEoqwOCm/zlvHWn34Sq5tJShnDw1XD6k0HRdfV
         t5JAOVwgF9q8QbqeW+ViJgAb4+T/J28bMV5ka0yi/WWA/t29jjKlRwx5kODfjDuRx5w5
         Q1prXntbMBP05I5vh1gGFP9nwL+X2E1dTDsDwyzn7Hi7Ol7OyNJ6XFOwVpw65uzL9nQq
         eemm4JWb8Py3dTDAsamGveNsJ3Tz9cy47GBnY86mAnHHjQtngqT5wUh7m9OA4KHVIiOK
         aPItbrpoqfZqGOHz4ZpYzS/Z84fbpNt6gfTM0P76QIhEaAXhm1zS1VhmMAso2qt/dseY
         ySbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708806066; x=1709410866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qMCmyVuJ+YwjHrCIo4ko9XwoXKrRHcalREosYeHxNXc=;
        b=GwxSrkH2BhxmbSQHgkfNwumf7NRrYrQqB94xtuNb9eishXaHXjzTmx0lOq2dHS79vJ
         xD5gnkINw8A6dVdSf9APbt3AXMyK/kj/ML4vfZ4LyFJzB58+Uc6vq7H19yrAJPjny8x6
         GPxhO2DTGGHwMkGSiwP0rXxO+Abt5Qt4P1fq9pRV/G1KOgct10+mkZpRdSfGrlYc1fiD
         DjFJRdhVe75GeKniHORd6d4O7LHjVagD3GxdaXYhxReiqT7rjKs0IITMWutogRNTDsFR
         esqBjiM5Q18I8u1XAziUSGS0ZNXj9K615LbzQFWFBzN35frue4rXwzNJSxAWx/konT8N
         Mgtw==
X-Forwarded-Encrypted: i=1; AJvYcCWkdzYZ7s62t+qHN/TTTQ20i5/lzzRC40PpJIBwnrh4JTETuEHF3gaIiXpITGS4UObKRYzYC9saXatux/mZKU1QFmUT8INRhtuAMwAC/s1/+p4=
X-Gm-Message-State: AOJu0Yw3js8IUFpTvVHrNzcic/V27o7plLdT99Y45g/uhze8MEIbysYk
	7gAKy9UFM0HiW03vl/0hQP94/5f/ZkeLuKQhhf+u+i0mXZP0Djl8lYFCJ9tHYJI=
X-Google-Smtp-Source: AGHT+IHFNAI0Xv1tyiOZGKweUmEOjy5ItYWEMGeKD0/G3QST9r+0j6ysSLDAuOz/E3BwJwri2VJemA==
X-Received: by 2002:a05:6820:296:b0:5a0:4598:7a90 with SMTP id q22-20020a056820029600b005a045987a90mr583929ood.5.1708806066047;
        Sat, 24 Feb 2024 12:21:06 -0800 (PST)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id e30-20020a4a91de000000b005a04afb627fsm450503ooh.24.2024.02.24.12.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Feb 2024 12:21:05 -0800 (PST)
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
Subject: [PATCH v3 15/15] arm64: dts: exynos: Add CPU clocks for Exynos850
Date: Sat, 24 Feb 2024 14:20:53 -0600
Message-Id: <20240224202053.25313-16-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240224202053.25313-1-semen.protsenko@linaro.org>
References: <20240224202053.25313-1-semen.protsenko@linaro.org>
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
Changes in v3:
  - none

Changes in v2:
  - Added "for Exynos850" part to the commit title

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

