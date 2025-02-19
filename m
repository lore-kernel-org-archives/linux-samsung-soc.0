Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272891DDC35
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Feb 2025 08:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739955456; cv=none; b=bePIoJcEmmbtEmM27i3vKQs8jyI75oygDiqWQL3eqqSNbPb8xYbqeopN83g77JO+xYBxmFYLP5qHDLcVXC4Tuo2jqAZXhdt67gDB+jZtQxrZuGBZ41CEpD2cfycPjYzekiRR52DSQTp6ys5ivPdnMbWLfPFrKczCXwLTHu/1HKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739955456; c=relaxed/simple;
	bh=XGZ6u2IRBOTO0vTt4hFrZXu+pM/Ns3vHyH1GrUC+VEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ea0cLVJYq7/fmGEE3UZdV6U8FQE5QOXoLpBRAmBbHaxl6fPJjk09Npacn1SnAcwRrNSsqxy2uIu5jsSFb6MX4CAZJMBqhuP4WSit03E18/NmkhPsQYOh/vt1JO1MYW8qyoADh2Bgf3cZFO4JMn18fuAHTaLuoav+huT0OoY2IaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hkOJBkMg; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hkOJBkMg"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4397185cfa9so3642295e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Feb 2025 00:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739955452; x=1740560252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmpBa7eMuH+mFF2ncMukFi4gUmii0gteNirg9Prls7g=;
        b=hkOJBkMgFmfntpkqClpP8e4K1k1SznYq2FpNObMcSx7gQerVqoNWxTxIZUcN7D5Eym
         tRggyJe51kU1b/LtO8HBxmkG8YLazKBFOMbwsA+8pA2arfdYL1SNbwzt/aUeHXNdaFq7
         0mLJCzBa109hQGAKKipKV27kQ2lN/cl63PeUd1YtSZEV4OUzF9O6UgN0PWih3WD2X+GU
         1Bwuqvr6tQf3S8NbvXGY7q7U7Wy9Rmosp/ZBkOZXUInX8TD7winXJcvZ6quQ09TfeOGc
         xjUbgYhYf8BtoWHNT30Mm+wqZWTz+kMD8JRirD96oRWJ6gHJ0KSexWD+QAN2uFrswPpk
         ppjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739955452; x=1740560252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mmpBa7eMuH+mFF2ncMukFi4gUmii0gteNirg9Prls7g=;
        b=KTkOYZFL/zt8mvjg+n7GRPSIyZnxhfnDAlBHpF/vzuUGcctBbCp727Gdmud2WNq+4c
         gdTkX+ZF4M0FJNGt0XxE4aQZ+Xt/Ehb2vSFs3X8y1dz1QVxb3Xg1XDAoMIeWeOmfXMe4
         PA2lsS4iOk30z7c55+GlPekN7VKS0FIKcbrjiMkE4FIzNLrHA+ukEluluhrNXVd3dfbV
         WT7sg1TsrVkqUfwlDNW0EjOM5tJUm6Kx5EllaU6IfNm2Up7BzDqLwPHO9z137aCVgeZL
         gQ5O08OG/zuCHqzZnbtmPmrkHhCtMX0MwP+j30IW0HvSH6rgw52jC3Oma0+QbOnKnYW9
         nNnw==
X-Forwarded-Encrypted: i=1; AJvYcCXoLuGhLx/hlBVJhsWyjNvMhG6EpjkJC4eJJI2T1/W0EErCm4SSoG/Kg47BgTylFzaU/ZW9t+dFaX2ArLXNtvqiXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbDqte8bu3P8tlGQIOiaIn/JgLP0/wDRREfQo2cjZJ1lfa7DKO
	64T3IGs7MvSzmPj32AdMfDz0bZaZ2yoFDyU4DVgRYrTMPJnyWnOFL0IWs+eFmss=
X-Gm-Gg: ASbGncuaBeghrues5xqppiFWDKNK2OFDa5pUmkFxiaQ66il7DJIczw7dV6i4KlK6j/j
	fOcULtKwKbytP8DKN/rTWo+OBnkM4R+i7LPSfVNTLLKggE/WyNJ7Z3I7YXHCqDwh09LykGY3VX+
	o4G4h4BdMCNuiFu0oZwjaQZ5Ba6npA5mLYvdDoWauuqiB+9KC8UMDiRu02BM85IwUSYngfskYhQ
	iv9NzkJmIuYdRnBAybcsZsPy7p4kZ8nPvLyLDHCioVHc+14Ysx3M7qSPNTsRbLIar2rph0kXdmI
	eXIf4R/te/+5/HRVGYKrGuslX2J3Vw==
X-Google-Smtp-Source: AGHT+IHMgGpLmNZh2KOBXIVt5Xtg6SHJM16bLaqEQLg+J9+rGOfQPsKNJHHPFxgxlEla7/c81KlrTA==
X-Received: by 2002:a5d:5850:0:b0:385:edd4:1242 with SMTP id ffacd0b85a97d-38f33f50c0fmr6700963f8f.10.1739955452455;
        Wed, 19 Feb 2025 00:57:32 -0800 (PST)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4399beadf31sm10007375e9.0.2025.02.19.00.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 00:57:31 -0800 (PST)
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
Subject: [PATCH 2/2] arm64: dts: tesla: Change labels to lower-case
Date: Wed, 19 Feb 2025 09:57:26 +0100
Message-ID: <20250219085726.70824-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250219085726.70824-1-krzysztof.kozlowski@linaro.org>
References: <20250219085726.70824-1-krzysztof.kozlowski@linaro.org>
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
 arch/arm64/boot/dts/tesla/fsd.dtsi | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index 690b4ed9c29b..9951eef9507c 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -92,7 +92,7 @@ cpucl0_0: cpu@0 {
 				reg = <0x0 0x000>;
 				enable-method = "psci";
 				clock-frequency = <2400000000>;
-				cpu-idle-states = <&CPU_SLEEP>;
+				cpu-idle-states = <&cpu_sleep>;
 				i-cache-size = <0xc000>;
 				i-cache-line-size = <64>;
 				i-cache-sets = <256>;
@@ -108,7 +108,7 @@ cpucl0_1: cpu@1 {
 				reg = <0x0 0x001>;
 				enable-method = "psci";
 				clock-frequency = <2400000000>;
-				cpu-idle-states = <&CPU_SLEEP>;
+				cpu-idle-states = <&cpu_sleep>;
 				i-cache-size = <0xc000>;
 				i-cache-line-size = <64>;
 				i-cache-sets = <256>;
@@ -124,7 +124,7 @@ cpucl0_2: cpu@2 {
 				reg = <0x0 0x002>;
 				enable-method = "psci";
 				clock-frequency = <2400000000>;
-				cpu-idle-states = <&CPU_SLEEP>;
+				cpu-idle-states = <&cpu_sleep>;
 				i-cache-size = <0xc000>;
 				i-cache-line-size = <64>;
 				i-cache-sets = <256>;
@@ -139,7 +139,7 @@ cpucl0_3: cpu@3 {
 				compatible = "arm,cortex-a72";
 				reg = <0x0 0x003>;
 				enable-method = "psci";
-				cpu-idle-states = <&CPU_SLEEP>;
+				cpu-idle-states = <&cpu_sleep>;
 				i-cache-size = <0xc000>;
 				i-cache-line-size = <64>;
 				i-cache-sets = <256>;
@@ -156,7 +156,7 @@ cpucl1_0: cpu@100 {
 				reg = <0x0 0x100>;
 				enable-method = "psci";
 				clock-frequency = <2400000000>;
-				cpu-idle-states = <&CPU_SLEEP>;
+				cpu-idle-states = <&cpu_sleep>;
 				i-cache-size = <0xc000>;
 				i-cache-line-size = <64>;
 				i-cache-sets = <256>;
@@ -172,7 +172,7 @@ cpucl1_1: cpu@101 {
 				reg = <0x0 0x101>;
 				enable-method = "psci";
 				clock-frequency = <2400000000>;
-				cpu-idle-states = <&CPU_SLEEP>;
+				cpu-idle-states = <&cpu_sleep>;
 				i-cache-size = <0xc000>;
 				i-cache-line-size = <64>;
 				i-cache-sets = <256>;
@@ -188,7 +188,7 @@ cpucl1_2: cpu@102 {
 				reg = <0x0 0x102>;
 				enable-method = "psci";
 				clock-frequency = <2400000000>;
-				cpu-idle-states = <&CPU_SLEEP>;
+				cpu-idle-states = <&cpu_sleep>;
 				i-cache-size = <0xc000>;
 				i-cache-line-size = <64>;
 				i-cache-sets = <256>;
@@ -204,7 +204,7 @@ cpucl1_3: cpu@103 {
 				reg = <0x0 0x103>;
 				enable-method = "psci";
 				clock-frequency = <2400000000>;
-				cpu-idle-states = <&CPU_SLEEP>;
+				cpu-idle-states = <&cpu_sleep>;
 				i-cache-size = <0xc000>;
 				i-cache-line-size = <64>;
 				i-cache-sets = <256>;
@@ -221,7 +221,7 @@ cpucl2_0: cpu@200 {
 				reg = <0x0 0x200>;
 				enable-method = "psci";
 				clock-frequency = <2400000000>;
-				cpu-idle-states = <&CPU_SLEEP>;
+				cpu-idle-states = <&cpu_sleep>;
 				i-cache-size = <0xc000>;
 				i-cache-line-size = <64>;
 				i-cache-sets = <256>;
@@ -237,7 +237,7 @@ cpucl2_1: cpu@201 {
 				reg = <0x0 0x201>;
 				enable-method = "psci";
 				clock-frequency = <2400000000>;
-				cpu-idle-states = <&CPU_SLEEP>;
+				cpu-idle-states = <&cpu_sleep>;
 				i-cache-size = <0xc000>;
 				i-cache-line-size = <64>;
 				i-cache-sets = <256>;
@@ -253,7 +253,7 @@ cpucl2_2: cpu@202 {
 				reg = <0x0 0x202>;
 				enable-method = "psci";
 				clock-frequency = <2400000000>;
-				cpu-idle-states = <&CPU_SLEEP>;
+				cpu-idle-states = <&cpu_sleep>;
 				i-cache-size = <0xc000>;
 				i-cache-line-size = <64>;
 				i-cache-sets = <256>;
@@ -269,7 +269,7 @@ cpucl2_3: cpu@203 {
 				reg = <0x0 0x203>;
 				enable-method = "psci";
 				clock-frequency = <2400000000>;
-				cpu-idle-states = <&CPU_SLEEP>;
+				cpu-idle-states = <&cpu_sleep>;
 				i-cache-size = <0xc000>;
 				i-cache-line-size = <64>;
 				i-cache-sets = <256>;
@@ -291,7 +291,7 @@ cpucl_l2: l2-cache0 {
 		idle-states {
 			entry-method = "psci";
 
-			CPU_SLEEP: cpu-sleep {
+			cpu_sleep: cpu-sleep {
 				idle-state-name = "c2";
 				compatible = "arm,idle-state";
 				local-timer-stop;
-- 
2.43.0

