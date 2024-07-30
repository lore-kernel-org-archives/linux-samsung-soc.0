Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D42194128;
	Tue, 30 Jul 2024 09:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722330837; cv=none; b=CvFlsZGLexU//YFGth1s0OyrRFFJFZzSRt1mq0WhPquvHEpjUealoOldGKI6hQ4lq0dk7/OoZYkzgJ6EkgFjt+YfrJfpbatLqg3ADpc2jpPF4b2b6Du3UGe2jE7Ix8OHtYlYtFI6aRm7LPGFiOm9YAdC5i/DdJLnqgQAIyxFx4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722330837; c=relaxed/simple;
	bh=n1sYuD3MjHYMEBBOWvbiGn2fbZP5FS4MQHy84hCkJl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jb6InEcIkTEDrLL9Sve+G40s53U3WI4j9HuIC1te3aXxSCDInf/yLzprTapXwbFbtjgDqHwmldCQLJOrdhgaF+3lRBwoNjydhnnvitrSxXriEi6ml/KNlJP0kJQO4XuuxLDyYBVhK4xed8n58w69U+DPb/liHBAUqRjb6FJRrvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jidde2QB; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jidde2QB"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1fec34f94abso28891705ad.2;
        Tue, 30 Jul 2024 02:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722330836; x=1722935636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0FOV41hlSglKkyk1lbmBce/aSC9CS29cnin103FCZA=;
        b=Jidde2QBMn4I8sdaxCoHcMFEst3EGTQL9TjcaMdwHNCx7U+Tnxw3KZhTI30uKEMODU
         XqHwYMFxK26I7KbevVso1oLkkTAHG+1shujBT5mIEcRsEQ1wdaOA0Y3YaLfA98weHuSZ
         gbLFiwG9J2gFQZ+8uHi8WV7imWNgm/28wsy8wC1F6xenuZs4svBF0QL4MsOMPPrB6sp7
         7viUpcMUMSE8ScgpVoUe838m3emym36wnwjU9PBYBth0lOSB/cE6jKTsjg33zdOUtJIH
         chpS88F9FBdwanKa07uLVgcnl8AHfa6oERcflka29w6KhXOX4LA4THaS3dpB90kSowHF
         d/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722330836; x=1722935636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a0FOV41hlSglKkyk1lbmBce/aSC9CS29cnin103FCZA=;
        b=qjW1eGhByDOog2YvuwKHoH8B9ts5bq+ClKo90XRz4ILYcZckYbAH46GFLgAcZQu6j0
         JNAd8ws+HS4XZLw1hNd7RyrIvKEbTNzk7ZLlxQdFTeVKV9oN7sBa8NrdjPcbmO5JpmMj
         Sm6zL2C7lVdthzCq3n3LWX6b//YYLSTCyyQKlN6owYZ+OWCaQMA2TxZtf/CkRafNmGAv
         mQ3Fl9/QAO+gD+u997C3q6zzLMvP0bZPaoKqKHF5KwGv94e8T7livZ/4nQcwhYURzWjP
         1ChAuE/ksS723/f5aCsrTKnxPoi6ln9kd2cKwOSpo3jCACNngYIHnzxj908rw8aiAh5D
         dd0g==
X-Forwarded-Encrypted: i=1; AJvYcCWrXwAgGH9lq99FoOwzF6JoI9n2CS5oKSctvMKs9aNiIvwO1gvA2MQ14kV3IHhwGML0we3oxgtzGXKj7N1QAzMMhwQsofYOnohAw1S0ntdWBjbGnSwYquuZSu5+5Holzmu2avF2wbS0UP0pfQJNJNxlOx1vxEh3WrgLdmAmFXg4GtskLhfdEGh1FGyc
X-Gm-Message-State: AOJu0YzUMhIp05Fqn5Ss2odbWqJR1tuzcJIBSYQSXvbxigcHuUurxXPh
	FYO69Dp9oo3nwiTpEl1HcIj2qNf3knx+DEfMW99kSnWc5prah9ES
X-Google-Smtp-Source: AGHT+IFJZMmoK9n+EkJYAXejt/K7rDTAoEy+l/xOn0YQNuJIG8N02LJbOas6AZdB8iFFApnSMQG9ZA==
X-Received: by 2002:a17:90a:468d:b0:2c9:7e80:6bc8 with SMTP id 98e67ed59e1d1-2cf7e71b37emr7818049a91.37.1722330835527;
        Tue, 30 Jul 2024 02:13:55 -0700 (PDT)
Received: from localhost.localdomain ([113.30.217.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cf28c565c9sm10023970a91.3.2024.07.30.02.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 02:13:55 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Anand Moon <linux.amoon@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] ARM: dts: samsung: Add cache information to the Exynos542x SoC
Date: Tue, 30 Jul 2024 14:43:19 +0530
Message-ID: <20240730091322.5741-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240730091322.5741-1-linux.amoon@gmail.com>
References: <20240730091322.5741-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per Exynos 5422 user manual add missing cache information to
the Exynos542x SoC.

- Each Cortex-A7 core has 32 KB of instruction cache and
	32 KB of L1 data cache available.
- Each Cortex-A15 core has 32 KB of L1 instruction cache and
	32 KB of L1 data cache available.
- The little (A7) cluster has 512 KB of unified L2 cache available.
- The big (A15) cluster has 2 MB of unified L2 cache available.

Features:
- Exynos 5422 support cache coherency interconnect (CCI) bus with
  L2 cache snooping capability. This hardware automatic L2 cache
  snooping removes the efforts of synchronizing the contents of the
  two L2 caches in core switching event.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 .../arm/boot/dts/samsung/exynos5422-cpus.dtsi | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos5422-cpus.dtsi b/arch/arm/boot/dts/samsung/exynos5422-cpus.dtsi
index 412a0bb4b988..9b9b2bdfb522 100644
--- a/arch/arm/boot/dts/samsung/exynos5422-cpus.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos5422-cpus.dtsi
@@ -59,6 +59,13 @@ cpu0: cpu@100 {
 			reg = <0x100>;
 			clocks = <&clock CLK_KFC_CLK>;
 			clock-frequency = <1000000000>;
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&L2_a7>;
 			cci-control-port = <&cci_control0>;
 			operating-points-v2 = <&cluster_a7_opp_table>;
 			#cooling-cells = <2>; /* min followed by max */
@@ -72,6 +79,13 @@ cpu1: cpu@101 {
 			reg = <0x101>;
 			clocks = <&clock CLK_KFC_CLK>;
 			clock-frequency = <1000000000>;
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&L2_a7>;
 			cci-control-port = <&cci_control0>;
 			operating-points-v2 = <&cluster_a7_opp_table>;
 			#cooling-cells = <2>; /* min followed by max */
@@ -85,6 +99,13 @@ cpu2: cpu@102 {
 			reg = <0x102>;
 			clocks = <&clock CLK_KFC_CLK>;
 			clock-frequency = <1000000000>;
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&L2_a7>;
 			cci-control-port = <&cci_control0>;
 			operating-points-v2 = <&cluster_a7_opp_table>;
 			#cooling-cells = <2>; /* min followed by max */
@@ -98,6 +119,13 @@ cpu3: cpu@103 {
 			reg = <0x103>;
 			clocks = <&clock CLK_KFC_CLK>;
 			clock-frequency = <1000000000>;
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&L2_a7>;
 			cci-control-port = <&cci_control0>;
 			operating-points-v2 = <&cluster_a7_opp_table>;
 			#cooling-cells = <2>; /* min followed by max */
@@ -111,6 +139,13 @@ cpu4: cpu@0 {
 			reg = <0x0>;
 			clocks = <&clock CLK_ARM_CLK>;
 			clock-frequency = <1800000000>;
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&L2_a15>;
 			cci-control-port = <&cci_control1>;
 			operating-points-v2 = <&cluster_a15_opp_table>;
 			#cooling-cells = <2>; /* min followed by max */
@@ -124,6 +159,13 @@ cpu5: cpu@1 {
 			reg = <0x1>;
 			clocks = <&clock CLK_ARM_CLK>;
 			clock-frequency = <1800000000>;
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&L2_a15>;
 			cci-control-port = <&cci_control1>;
 			operating-points-v2 = <&cluster_a15_opp_table>;
 			#cooling-cells = <2>; /* min followed by max */
@@ -137,6 +179,13 @@ cpu6: cpu@2 {
 			reg = <0x2>;
 			clocks = <&clock CLK_ARM_CLK>;
 			clock-frequency = <1800000000>;
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&L2_a15>;
 			cci-control-port = <&cci_control1>;
 			operating-points-v2 = <&cluster_a15_opp_table>;
 			#cooling-cells = <2>; /* min followed by max */
@@ -150,12 +199,37 @@ cpu7: cpu@3 {
 			reg = <0x3>;
 			clocks = <&clock CLK_ARM_CLK>;
 			clock-frequency = <1800000000>;
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&L2_a15>;
 			cci-control-port = <&cci_control1>;
 			operating-points-v2 = <&cluster_a15_opp_table>;
 			#cooling-cells = <2>; /* min followed by max */
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <310>;
 		};
+
+		L2_a7: l2-cache-cluster0 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x80000>;	/* L2. 512 KB */
+			cache-line-size = <64>;
+			cache-sets = <512>;
+		};
+
+		L2_a15: l2-cache-cluster1 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x200000>; /* L2, 2M */
+			cache-line-size = <64>;
+			cache-sets = <512>;
+		};
 	};
 };
 
-- 
2.44.0

