Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFF41CAA68
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Feb 2025 08:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739955453; cv=none; b=Ul1+fWpTqA9LeiggoinZ723UlLX9W1JozMGb+pyf7BXTcTf2w6bTR1uOXV76fAc4/DLvA+B5KC+Jc2osagTA5eMr/hEiWHc3tUf+kpfoYAclwym7OEkA4VZttGBTsD3f6vMJCtHdYyIxgq5GrdNbLoAfYIKv8EXUoeo5J7C/pZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739955453; c=relaxed/simple;
	bh=5feNgE4Z0VyR3BH4VrqG8+EjOe3cq6YlQsxGTVhOkJE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=atMPJZ4jafEOgjBntSk8FfHtefGSq0HU0HGhLUh/w/46jWjvy6qO+uum362EsuA5mTFc75wFe6qmaSQM/e5UqSS/6NxwW18IB5Va5XvZEU7qQxkUi4DC9NgXpaoGypA89qK6iJ7IrrS2jnDOpFKK4ThR/o70lZFmpwdwKy9R1bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ru22cKO3; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ru22cKO3"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-439990502bdso1432915e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Feb 2025 00:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739955450; x=1740560250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PRDH7JUOK4Qt3XrdNtvjAwI3P3XDa0EtyA9y0a/Ff1Y=;
        b=Ru22cKO3w1Sh0ozJfXUZIxGEOZn4+WRiegUhdLUzv2SHaFP8p12AXeoJt68okNKW6A
         W9aV0Rzg2wjDmUQjOw26HUNTSeey2bztSRGjvHR6LAKVwWUbBRdxSSUy/YCZvm2PvLSh
         8AxjQs47pPn2IF+q3RXiJzQV6r+t3ROMLtfydeefkYWdOAxjeyl+tEKrngfWEAFtBQta
         zgQOv0FtTv0p6dYtbQmulhW1qP1MseQuOVWjrKUGUBvykDVkmYCQ4M//yrpxpnVsHrL8
         uvlHiVMFAw3MioS7ChN0kG1IkalZF5dUYOPH/vPEibB5ORqsTPsyf/8loUePcefk1yzJ
         AIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739955450; x=1740560250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PRDH7JUOK4Qt3XrdNtvjAwI3P3XDa0EtyA9y0a/Ff1Y=;
        b=M1pUZpkrnoqgmfU+mAas3GzmNn/BaAtANzXmZh0f/ifuy8AcJJ4Q9Z4H22KrD3+qXH
         fDPFy1pap3tuBII7t1C816tzRhV5HZhrI2YBO85z1Jndro8lTDZLzwrYe5LSb8naHl98
         Dt13MeqUHf8nMVz/LBU0uwNy09SA1bl3oQ/I2x94jR+a2SiX2FSVhwa+Ui7AHIa/+GBP
         /DOOGVqQzBPzn4U6XJHnaLGDzOypCd+j64tdgU5iRirnuU/xn4G17B2Q0mjyRI+6/FBA
         Fl6jFI+71MdhU0JSCZfRUyK69hc2a+P+Zhdr8cAe0jgqQb7rwUjy43qfcCUk/V8YaFnO
         VUMA==
X-Forwarded-Encrypted: i=1; AJvYcCVETcFpS5f/HgcheuAyYphL7a73wXcP4FLx1RGUIKG9giuWDtx9tafwMPFDXWek+/1Th+FDXxw0qabeE4BhZLhsfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGlqlMROjupmM9vjwLEkkqDR7H9c/sXlK13GnajsdodBfHMCEY
	XF0PNRauSjtlDt8vxt8qWOm+v+Pkcw23SCZElxUIl5JVY3bcdPo/scFIJzIwrcs=
X-Gm-Gg: ASbGncvuI3/ZGz8wcz6H2mo9D1HGhQC/8eZpY8/4+Bg/kgUHR0a8qDY+UUdv6mQ1SEJ
	1fNFgQsTDGa5u5egoUi96vovhWs9Lb1FFfORUDr64/2ys4gzfMweACATlRYMGOA3yuO7nqMA5jV
	N0janGInp248/MrOOMZVj/m4E9E/5FGZKb+WshGnJ7vLgdHwNk+SCm77kGdOVzKKf2Qkjw6fRb4
	ZAVvpj4tZWQ3pOU5nKt6zZg7ysDIOFjLQ+EUixzz/HYefTE/pJLtP8HyvL864XjV1IOPaGFQgt5
	x+7DSqfCZ2As70Oyw/QN1G/87Ba/cw==
X-Google-Smtp-Source: AGHT+IGb1jEC7y+Y7Rl+PioMxXoJSfQnw0OF7LzA+zc795fUjhCn+RhDum3IRhMvx+QUGzwJ/XfnIA==
X-Received: by 2002:a05:600c:2d04:b0:439:84d3:f7fd with SMTP id 5b1f17b1804b1-43984d3fb0bmr37040725e9.4.1739955449623;
        Wed, 19 Feb 2025 00:57:29 -0800 (PST)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4399beadf31sm10007375e9.0.2025.02.19.00.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 00:57:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-fsd@tesla.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] arm64: dts: exynos: gs101: Change labels to lower-case
Date: Wed, 19 Feb 2025 09:57:25 +0100
Message-ID: <20250219085726.70824-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DTS coding style expects labels to be lowercase.  No functional impact.
Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 22 ++++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 813f96089578..80c1af3a8836 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -73,7 +73,7 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0000>;
 			enable-method = "psci";
-			cpu-idle-states = <&ANANKE_CPU_SLEEP>;
+			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
 			dynamic-power-coefficient = <70>;
 		};
@@ -83,7 +83,7 @@ cpu1: cpu@100 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0100>;
 			enable-method = "psci";
-			cpu-idle-states = <&ANANKE_CPU_SLEEP>;
+			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
 			dynamic-power-coefficient = <70>;
 		};
@@ -93,7 +93,7 @@ cpu2: cpu@200 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0200>;
 			enable-method = "psci";
-			cpu-idle-states = <&ANANKE_CPU_SLEEP>;
+			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
 			dynamic-power-coefficient = <70>;
 		};
@@ -103,7 +103,7 @@ cpu3: cpu@300 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0300>;
 			enable-method = "psci";
-			cpu-idle-states = <&ANANKE_CPU_SLEEP>;
+			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
 			dynamic-power-coefficient = <70>;
 		};
@@ -113,7 +113,7 @@ cpu4: cpu@400 {
 			compatible = "arm,cortex-a76";
 			reg = <0x0400>;
 			enable-method = "psci";
-			cpu-idle-states = <&ENYO_CPU_SLEEP>;
+			cpu-idle-states = <&enyo_cpu_sleep>;
 			capacity-dmips-mhz = <620>;
 			dynamic-power-coefficient = <284>;
 		};
@@ -123,7 +123,7 @@ cpu5: cpu@500 {
 			compatible = "arm,cortex-a76";
 			reg = <0x0500>;
 			enable-method = "psci";
-			cpu-idle-states = <&ENYO_CPU_SLEEP>;
+			cpu-idle-states = <&enyo_cpu_sleep>;
 			capacity-dmips-mhz = <620>;
 			dynamic-power-coefficient = <284>;
 		};
@@ -133,7 +133,7 @@ cpu6: cpu@600 {
 			compatible = "arm,cortex-x1";
 			reg = <0x0600>;
 			enable-method = "psci";
-			cpu-idle-states = <&HERA_CPU_SLEEP>;
+			cpu-idle-states = <&hera_cpu_sleep>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <650>;
 		};
@@ -143,7 +143,7 @@ cpu7: cpu@700 {
 			compatible = "arm,cortex-x1";
 			reg = <0x0700>;
 			enable-method = "psci";
-			cpu-idle-states = <&HERA_CPU_SLEEP>;
+			cpu-idle-states = <&hera_cpu_sleep>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <650>;
 		};
@@ -151,7 +151,7 @@ cpu7: cpu@700 {
 		idle-states {
 			entry-method = "psci";
 
-			ANANKE_CPU_SLEEP: cpu-ananke-sleep {
+			ananke_cpu_sleep: cpu-ananke-sleep {
 				idle-state-name = "c2";
 				compatible = "arm,idle-state";
 				arm,psci-suspend-param = <0x0010000>;
@@ -160,7 +160,7 @@ ANANKE_CPU_SLEEP: cpu-ananke-sleep {
 				min-residency-us = <2000>;
 			};
 
-			ENYO_CPU_SLEEP: cpu-enyo-sleep {
+			enyo_cpu_sleep: cpu-enyo-sleep {
 				idle-state-name = "c2";
 				compatible = "arm,idle-state";
 				arm,psci-suspend-param = <0x0010000>;
@@ -169,7 +169,7 @@ ENYO_CPU_SLEEP: cpu-enyo-sleep {
 				min-residency-us = <2500>;
 			};
 
-			HERA_CPU_SLEEP: cpu-hera-sleep {
+			hera_cpu_sleep: cpu-hera-sleep {
 				idle-state-name = "c2";
 				compatible = "arm,idle-state";
 				arm,psci-suspend-param = <0x0010000>;
-- 
2.43.0

