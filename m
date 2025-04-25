Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE975253F2D;
	Fri, 25 Apr 2025 13:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745587737; cv=none; b=Orm2p/QCzSmIseBp4Gz5q6OppwppwEady5yWqMktOQzW/EFqq/ptuyt7fZ6iKXmToB/Mkrzr4yUEOk4pUkqcIAlCZeYd/kGiaC4e3DjunUKR2c9JR/yudWDpnsaoptfnC/tPPXxQzKoI5iKwWLKm8lHxelLCiF6iO2SdLCLWZJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745587737; c=relaxed/simple;
	bh=kn00qcnx0icFV5X4z/Nn+EpEfRBnS6IG+unmxZovTwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rgMrckRm5GOemxtw+cM5kbaID9NzhCKaTWxG151cwfFMZtmV/pphuQlg5BhcG9n9GO6ibTQ6QnhuRmrdkvaGInjf7j0DssylQTI5Mvug9vavcIxEuVWPtM4P02+Vf2g7Dn44IhXsfY23iyzwpois5h0exwPhVjr6hgZDxP/HtyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c++SOB3I; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c++SOB3I"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-af548cb1f83so2253596a12.3;
        Fri, 25 Apr 2025 06:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745587735; x=1746192535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3GEbJiWXV9b1fuX8u/LXLdwA8q1DhCUgWs2zybLksA=;
        b=c++SOB3I45lTavJX9x0SgKt6xfQT9LPU8Rfx7oyJgFjaQvDo42bD2w5kqG4AfgGrvc
         XgdZ0yK1NMIS/YgfIM9z3fn4VqHJE1OF8jpwFDiC9X+BKZ76RBG9agBflanxPeJXyzu/
         7ezwAJvVSX+ewtv+Rr8wHJZKUCQwWM2hKZbKM3qDgEkQjpiLoMqgmM7tqklhYx344a4x
         FrjlKHaB8ktqraQpoOt2G24rPkym+7Dvj0URXBTekUlnvfnYoGF6SAQh5k/F3RxV3SIE
         asqS+uEsf43n8i9fPcB84hJAYFjtamMrKIX1oP+sMpuEZRHg91Hvw9JmpoUuhs9dsaja
         3WtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587735; x=1746192535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3GEbJiWXV9b1fuX8u/LXLdwA8q1DhCUgWs2zybLksA=;
        b=skPi1yB0qQUgFVHWDI1xZWZKrCTWD3yN17snwTnUD9ftzUdUeg6OZIZwdfybnH2Z8n
         2oPBS7Ag5UHi+nSHNgpifHRKP+K7y6By6oVNWGlaJdyXz35K3dHUIA8Nwk5/jQqYtsDc
         lfTg0EYvHtnX7d8zlyWv+/qdBmN6eWJjfd6zo/ClN5Pfz1d1YnaRQGDNXrU6ImL0Zt96
         dkBKlZgHGSmcWu6Bjxzk5Hi0pUkicH+qL9clPJZ7lkpSpb8M3Hgzde/SK1UQB1lYvTLV
         3EuGNplUw7GfYfI4njgR6WEC+BvuGl8wZS+8YoWF4a7dTBLH+Dzgctay15z6OiGB/T1t
         005g==
X-Forwarded-Encrypted: i=1; AJvYcCV71/LJaAjzg5PCXXQOBgFs+huEe+/az52/HPFxaGVxZSQbe/T6i/NK3JxuHFHawYUAW5yASYHKYiRx@vger.kernel.org, AJvYcCVcPmrD0C0CS3JRq7NizXWLfK0mtWKBQift2c3CbSe3TjFDygpKC1JRT+FydlWUo3NjNt9HmDBeHUvP/dynEgPxOOE=@vger.kernel.org, AJvYcCWZpuOJ5b4WvTh9ytmwDJK5KcIOno9ktp6+Mokvpl70os4M7PO3Ve0XCsX/7RV7Ir2SNok4ZRqkDGIRtEN0@vger.kernel.org, AJvYcCWhhA5DY23hbnWQU/oWJ7SW8tF/jh3kQemazf2KN3VgR8AM+mS9cbf3JXIQbGE3tFIuKVHhyaqNu84x@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjm+0d+Pb9CbFrDEcCAwD1E0JffX7LEM3CLGdM6rDP2is+wcuI
	6dWM1XGTCvp11iCrdu78frJLhL8ZLHYwHOPoWRDt4pWotR6gmqqQ
X-Gm-Gg: ASbGnculScubhCErd4cFgU8C/cSh+7QjiRYCZRAMHjvqceMDPTMxhU8aiRCfRtK+B/7
	sAwVjzBAK95xZxoOIWkHgka/Q8BJoMz4kPYgQLLyHSAoTqSI38a0jfCG7wxyZ6/Ji6OcuGiVbrH
	mZaEiZCQo/scASGhNge4qK1fMmqBg4hcRDKo5OhW91KXtP4uMdIUs4fcQ8L+0TVr31x2zaptnKw
	QqS1m6o7ajGWDes2GusF+ywwCCYSGRbXJfUORFhQc7t6a1K8oPlkEi/9TFxQQP7+yCRzZrwGNn2
	nvEJPSS3fFDFeqoszpZ2gfMWM5Ek5p8h7MBZFq0PefDY3/Pu4DFl6A==
X-Google-Smtp-Source: AGHT+IHVqQyL9yHnD5wGAhRJP0fI3BxEExGHqelTRbyUpRiHzjzSj3ubBlLL93k+wof+NtwrNid62g==
X-Received: by 2002:a17:90b:57eb:b0:2f8:49ad:4079 with SMTP id 98e67ed59e1d1-309f7da5af5mr3905732a91.6.1745587734998;
        Fri, 25 Apr 2025 06:28:54 -0700 (PDT)
Received: from localhost.localdomain ([110.44.101.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f7752a03sm1564313a91.18.2025.04.25.06.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:28:54 -0700 (PDT)
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
Subject: [PATCH v1 08/10] ARM: dts: exynos: Add proper regulator states for suspend-to-mem for Exyno5250 smdk5250
Date: Fri, 25 Apr 2025 18:56:28 +0530
Message-ID: <20250425132727.5160-9-linux.amoon@gmail.com>
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
 .../boot/dts/samsung/exynos5250-smdk5250.dts  | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts b/arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts
index d41409019671..866e56915a2a 100644
--- a/arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts
@@ -165,6 +165,10 @@ ldo2_reg: LDO2 {
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <1200000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo3_reg: LDO3 {
@@ -191,6 +195,10 @@ ldo6_reg: LDO6 {
 				regulator-min-microvolt = <1100000>;
 				regulator-max-microvolt = <1100000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo7_reg: LDO7 {
@@ -198,12 +206,20 @@ ldo7_reg: LDO7 {
 				regulator-min-microvolt = <1100000>;
 				regulator-max-microvolt = <1100000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo8_reg: LDO8 {
 				regulator-name = "P1.0V_LDO_OUT8";
 				regulator-min-microvolt = <1000000>;
 				regulator-max-microvolt = <1000000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo10_reg: LDO10 {
@@ -211,18 +227,30 @@ ldo10_reg: LDO10 {
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo11_reg: LDO11 {
 				regulator-name = "P1.8V_LDO_OUT11";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo12_reg: LDO12 {
 				regulator-name = "P3.0V_LDO_OUT12";
 				regulator-min-microvolt = <3000000>;
 				regulator-max-microvolt = <3000000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo13_reg: LDO13 {
@@ -235,18 +263,30 @@ ldo14_reg: LDO14 {
 				regulator-name = "P1.8V_LDO_OUT14";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo15_reg: LDO15 {
 				regulator-name = "P1.0V_LDO_OUT15";
 				regulator-min-microvolt = <1000000>;
 				regulator-max-microvolt = <1000000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo16_reg: LDO16 {
 				regulator-name = "P1.8V_LDO_OUT16";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			buck1_reg: BUCK1 {
@@ -255,6 +295,10 @@ buck1_reg: BUCK1 {
 				regulator-max-microvolt = <1300000>;
 				regulator-always-on;
 				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			buck2_reg: BUCK2 {
@@ -263,6 +307,10 @@ buck2_reg: BUCK2 {
 				regulator-max-microvolt = <1350000>;
 				regulator-always-on;
 				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			buck3_reg: BUCK3 {
@@ -271,6 +319,10 @@ buck3_reg: BUCK3 {
 				regulator-max-microvolt = <1200000>;
 				regulator-always-on;
 				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			buck4_reg: BUCK4 {
@@ -279,6 +331,10 @@ buck4_reg: BUCK4 {
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

