Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A9C253946;
	Fri, 25 Apr 2025 13:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745587755; cv=none; b=u8dU9MirE6qXF3X/jNX/OjgUAT5Q1PxEwHrpG8CbAuT3M42oatCFw58V29dqnp6HPhl9y1T50DAOna4aG5B6MtzCCahOzVw9L4U9dGRdfeNLtjCqm+nTj4XXNY1wrk3F0mO49xbyMjrC/qS51vjzlXM8AOf6j7tkPcbFZyaSVfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745587755; c=relaxed/simple;
	bh=VoPEM5zp/x/iGTtvO2oRd3oUlSTK3tPj5NXXrOA2pNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ODTAk+wA2JPtcF8Hr0ueqgbVUvqNus7/4KsGG862F5h2NnQxL/pz1SB2LFm4oCX1hIOXwXA1yOuqicXENJeCkzonUPQp1eyYwnkT6lYQh9wRPUIz5MVwbgkuQ/GoiaRCZcIRnDuz8PzBkT+3+iZ1a5HwDdaQxrDUwp+s0yYrY00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPACdGtM; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPACdGtM"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-30828fc17adso2172053a91.1;
        Fri, 25 Apr 2025 06:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745587753; x=1746192553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01k0FR3gadfOW7bYhsG0pi30JzxZ7YHZvTgo3ghbW0I=;
        b=EPACdGtMmZzZzB6Mn7ZF++vymSvIdCnby/98s7Go9a8j9n9nnAVqEBHpwRpCAYLw8y
         nR0P6RJLPNQxWC6FxE+5JxYSNEnAspCn2zrBlT3uZ5xuK4EdXV4lAZ4PkU/Ws7NEmdU1
         Dy2Xzaky2yz3nCZ3s/3o73ABVAajdFAcmmZvmAZPbpPrS2swF3OxzOdPnbZoeFCJH0l8
         e5nrzN5+Mr/sf6xdUc0i086cDwj1GJlabl6ljHW/ssEpWF6Lzy/vdllIS8sRIKHx601l
         umt+zVPAU9frznvguK2ryM18klSUI/rfqnJlCE/LX27wrnxOEg/rP8VN2NOIkJM8J4ED
         EbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587753; x=1746192553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=01k0FR3gadfOW7bYhsG0pi30JzxZ7YHZvTgo3ghbW0I=;
        b=qHcM6nfYVhq9TEWhoSrQdxidp5boKL8Vk9GCNlTfiY61liLQRddGqsONXwkU60lfIp
         gN7qYv9TM/GIaw2K3fjN26q6jWHPoj/lzJA282R6GwT1Qfb6i1kCzAjnZVymHrALQSpQ
         k7x0kq3x16c9zfdlufRrjzSsD5WRZ25VXenYJfVpZyrUl/rAD1UcgD6FX+VfPv226kRw
         CMXyzKgOQqwByoNrhJNUrUiiTdtm1mG1Nr2YxGFnGpRd8o6RaL9OOIr6UK+IOtWcEBOR
         Af19k6Omlkt843G6hq4Z4Fgv8Mno3zHAGlEj5vnd45o6Dogfzr1bh7o2eIiwXxbJytsX
         lxSw==
X-Forwarded-Encrypted: i=1; AJvYcCUywsNFR0Pf696REWM1npWOUluhsLRJXHyye0lbogbwAsr5hsaPXSvK8f73JoqBCzcQ1DuorS4tzcZZHSohYrRQkck=@vger.kernel.org, AJvYcCXRlJofyfv7BQu1mmcrvI50dIiZPd8lar0R0eXW3pyyJ7N9PgfP9yN1mQ1Vk4DxhY56Jwd63PkQv1V4wCNT@vger.kernel.org, AJvYcCXVpvZnw0Txa21P+dEg9tEHbZe+RlbNWK7uF8gWY89XarDzB+aIyPEc1qeLF6NNRxJ2+IjbuhFw+SM0@vger.kernel.org, AJvYcCXgzozVhnGdRhxorsUC0Y6dsjP6G9Xf7DPLwKRDsrqMJWw5kJTEVUhYj61NEtUHXYPXNQ9OB9QClRb4@vger.kernel.org
X-Gm-Message-State: AOJu0YzUYm40A0wm5At8/5/6yuhNxQ50SMCpBm8cpauLvk7Zlz1merUf
	mPTdnnUxgrtqzpXDJBPb0QVBasz+ecsbRMBgNzxB/fHnz6b/whuI
X-Gm-Gg: ASbGncsKCBWQ39vfhGQdCjPO4++4RTVJzuo7o6aT+IyhF4J0GkkCuYmdIlLn8Krp/nB
	4Fhz4ucIVlSCFTamikksCkQzQy/S7tYNwhly+3P5XHcu4q6ar9H6t2ReT3SXscryvOIdEI1xTXw
	KippDzxmLQIKXOHmV3ksV/mY3IWpSUlsFHjlaKLSuuqkujtQkTJ42v300SPkeAEacS5jX40/yGE
	rvy4PHWszbjcnrTQ0OVD4Ro/bDB/JeDDUjTUElNJvbFDrRyHdgrB2vpmzfXGFjuPX01HO24Du1y
	BmiFdloRh7nsR/zNDP6saEjYM4qh0wnz4Y+YWXbHiLU6vcAGVd9SKg==
X-Google-Smtp-Source: AGHT+IGg9or9/EVXKbPbko2FEzf8DUz4YrsrKKDLHYz0xNXlwlVAF65DQ3EkGDa+iSIFAG3GfpeaFg==
X-Received: by 2002:a17:90b:5148:b0:2ee:f440:53ed with SMTP id 98e67ed59e1d1-309f7eb4b0amr3246854a91.31.1745587752974;
        Fri, 25 Apr 2025 06:29:12 -0700 (PDT)
Received: from localhost.localdomain ([110.44.101.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f7752a03sm1564313a91.18.2025.04.25.06.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:29:12 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-kernel@vger.kernel.org (open list:MAXIM PMIC AND MUIC DRIVERS FOR EXYNOS BASED BO...),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-samsung-soc@vger.kernel.org (open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 10/10] ARM: dts: exynos: Add proper regulator states for suspend-to-mem for Exynos5250 snow
Date: Fri, 25 Apr 2025 18:56:30 +0530
Message-ID: <20250425132727.5160-11-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425132727.5160-1-linux.amoon@gmail.com>
References: <20250425132727.5160-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MAX77686 PMCI is able to power down and up key core supplies and other
voltage rails via PWRREQ signal to enter / exit (deep) sleep mode.
PWRREQ status is ignored during initial power up and down processes.
All programming must be done before the AP enterns the sleep mode by
pulling PWRREQ low since the AP does not have programming capability
in (deep) sleep mode.

Add suspend-to-mem node to regulator core to be enabled or disabled
during system suspend and also support changing the regulator operating
mode during runtime and when the system enter sleep mode (stand by mode).

Regulators which can be turned off during system suspend:
        -LDOn   :       2, 6-8, 10-12, 14-16,
        -BUCKn  :       1-4.
Use standard regulator bindings for it ('regulator-off-in-suspend').

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 .../dts/samsung/exynos5250-snow-common.dtsi   | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi b/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi
index ca6ebd8a9d62..70c3e6da55b7 100644
--- a/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi
@@ -318,6 +318,10 @@ ldo2_reg: LDO2 {
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo3_reg: LDO3 {
@@ -332,6 +336,10 @@ ldo7_reg: LDO7 {
 				regulator-min-microvolt = <1100000>;
 				regulator-max-microvolt = <1100000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo8_reg: LDO8 {
@@ -339,6 +347,10 @@ ldo8_reg: LDO8 {
 				regulator-min-microvolt = <1000000>;
 				regulator-max-microvolt = <1000000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo10_reg: LDO10 {
@@ -346,6 +358,10 @@ ldo10_reg: LDO10 {
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo12_reg: LDO12 {
@@ -353,6 +369,10 @@ ldo12_reg: LDO12 {
 				regulator-min-microvolt = <3000000>;
 				regulator-max-microvolt = <3000000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo14_reg: LDO14 {
@@ -360,6 +380,10 @@ ldo14_reg: LDO14 {
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo15_reg: LDO15 {
@@ -367,6 +391,10 @@ ldo15_reg: LDO15 {
 				regulator-min-microvolt = <1000000>;
 				regulator-max-microvolt = <1000000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo16_reg: LDO16 {
@@ -374,6 +402,10 @@ ldo16_reg: LDO16 {
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			buck1_reg: BUCK1 {
@@ -382,6 +414,10 @@ buck1_reg: BUCK1 {
 				regulator-max-microvolt = <1300000>;
 				regulator-always-on;
 				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			buck2_reg: BUCK2 {
@@ -390,6 +426,10 @@ buck2_reg: BUCK2 {
 				regulator-max-microvolt = <1350000>;
 				regulator-always-on;
 				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			buck3_reg: BUCK3 {
@@ -398,6 +438,10 @@ buck3_reg: BUCK3 {
 				regulator-max-microvolt = <1200000>;
 				regulator-always-on;
 				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			buck4_reg: BUCK4 {
@@ -406,6 +450,10 @@ buck4_reg: BUCK4 {
 				regulator-max-microvolt = <1300000>;
 				regulator-always-on;
 				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			buck5_reg: BUCK5 {
-- 
2.49.0

