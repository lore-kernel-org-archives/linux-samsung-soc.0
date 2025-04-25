Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01BC2528E5;
	Fri, 25 Apr 2025 13:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745587692; cv=none; b=b+Dln8p4FeL5yUx5tGl8P2gbNqB902iQRF0/jhS5zgei1AvQ3iAw5PFZqZeBsYoWk06TpIoe6eVjMHDf5SvP8A2xrf3HuZT490yDk4i2pCVtvGC8K3mSighpbZmEdEJdQ5xBjCWA33a5d00n+a8kkG5Yln+bxKY6plPdOsheMow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745587692; c=relaxed/simple;
	bh=SrBLDeYF0/epGnxS/XR97UIxsYSTR8KPCNrTF1mvK9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oqmAXgljY9uA+dDKwii5Uo24gDrNY98dUIHIYYAv+/Fbt+ywsN8WRYv7DsYCu8vIYn6runaYGgKpd6kt1bf0dIY5Z6QCklEcdyGImqlmC8XZ5w39277Rk4Sk0BhG1YeUipMW2m8lSy3P3SE5EzBYrsArrWOVKOS0e4ix6RGagas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bWjmZQyy; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWjmZQyy"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-af5139ad9a2so1498091a12.1;
        Fri, 25 Apr 2025 06:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745587690; x=1746192490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5fJtFgz8Pc2XyTKgSfUOoq/oEt4LEs1nNniOPLnzWRQ=;
        b=bWjmZQyy8ISG/+qDCR4ueqUT93V6nf2rf/A72tCAYUEWT2Lglz7szpEB33gQ02lr21
         8Fp6gD65LnJoiBLd9ZBl+soNt66RUDOw+z6bFoxDI935FD2m6NpXtXYyNsxVFju3lhQB
         d6nZCU4YieclmehTjIMKRI78HwViBmzWk5PRClq0DUUA7swFXeC8h8CcgDyJZwNBzsRS
         O9GIHZvjegEBMTGlsjuKgpl+kdzLm7SDfYL1mGLkr0gtfwXTIhKpNOnCGK5PbKLpJSCE
         CyImUUef5GXeN7O32/eBYuCTqqLsTTm2XARDqOiVuL2YKAxGEUoZzRerujp+EemtYbgq
         QJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587690; x=1746192490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5fJtFgz8Pc2XyTKgSfUOoq/oEt4LEs1nNniOPLnzWRQ=;
        b=LJenzBq2M8kNIMUZTxLtLqSJRmcfUINME+D17iVGP58de80guWXAIpyooBCmtGjcCt
         QeG09DiBtnnhyNtZFXyE4mx4y81J73WdtW7HS99w8EV4BInq+6fP3lER0EIEv5k5nzg+
         f/IsWVXMfe4EDsn8TG6SjHTfo396DfdvP9vLVpR/YM16BO8UyF81N2RLApIFKX/PbI84
         Ko0LgmRYm/PbtVXfZ/5UFNtLP9mh092WHESBJGNfmrsQRstKprKAbMn7DwstPz9RXWAf
         nC7rXLpN9HF9MwB9VvfstG9XP2kl35fWVjlWzjOlI0RRK1LkDXG7orPdmLmjgqzeUbTN
         nRVw==
X-Forwarded-Encrypted: i=1; AJvYcCUaJwnuBFYx71sUEhR02thEWSESnHvceiJr2N8yW/+4JRY9+ktdKGvZQi+0oz2WFBmrFlpWWenXEnr0@vger.kernel.org, AJvYcCVS/RKyTYOBL3CQxdClb1WbhB+UO6f3LNlacAFlgobWlPatDGmdn41cJaTegsqHRUHzGcM6RnJx/IpYexLX@vger.kernel.org, AJvYcCVaNAReofepvEwgkqgIhutcQpmqwbztZFj1jy7xe45BxvXkVJsKfhMYss/ym8JtCsz9LFXU/WCAuUn4@vger.kernel.org, AJvYcCXM3XfyQRk30fBMoJQ4n6ULT4kEyXXhYw43QalcGxC1SvIjjoOT06REoNCn6VaGqDYVIM0udxtTWAo9w9tyW7s19lQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7iKDg221DZNcU6JlgzamUz91D16/UYriJzr1ctHIRvhqTbD1F
	4B7Cl3P0W2Ghjl8IYlOp8PuxZ8HgjiRUflXa/0UB+1ip51xGH/5myzy3RQ==
X-Gm-Gg: ASbGncsykD1iGMv8gsuLUTw/dOFfL+fTuhqsi9Neb5ZROIewkUenT9SlN+k/ILBiY5D
	SqgZX8aQKtH4s3jCdIH3ad8ERwNDXbnVBIZlyvC2oML6Ow5oQoKcGCYMsjoNp9Mgs9Cbe+26I7q
	OzC1BllNRGgC2HSrdaiWs28/aNwyafV4jdW50TQUZ17+KXScAxAbY0u55Pe4z4hAJ/h5/uniO9+
	yJCD0NLFgdMBa8gL5V+v3IF8+g9GRTwCAZufFPgWeYMs94w0/VQTstf0PJGR4ysO/uMBFtDCw74
	/sLPecPLAop8sF6Xayn0/Gx3y/PyPydT1GY7jnPM7Z3wYgWXPFF2/A==
X-Google-Smtp-Source: AGHT+IE0B0jfK5eB6DMRg7QdZ0TYxev8uNpIBvEu/A8yMtaqxyNFSybZ6GGMuVFKhth422xl8fGg7g==
X-Received: by 2002:a17:90b:3bcf:b0:2fe:7f40:420a with SMTP id 98e67ed59e1d1-309f7df30c5mr4530511a91.17.1745587689959;
        Fri, 25 Apr 2025 06:28:09 -0700 (PDT)
Received: from localhost.localdomain ([110.44.101.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f7752a03sm1564313a91.18.2025.04.25.06.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:28:09 -0700 (PDT)
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
Subject: [PATCH v1 03/10] ARM: dts: exynos: Add proper regulator states for suspend-to-mem for Exynos4412 Odroid
Date: Fri, 25 Apr 2025 18:56:23 +0530
Message-ID: <20250425132727.5160-4-linux.amoon@gmail.com>
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

MAX77686 PMCI is able to power down and up key core supplies and other
voltage rails via PWRREQ signal to enter / exit (deep) sleep mode.
PWRREQ status is ignored during initial power up and down processes.
All programming must be done before the AP enterns the sleep mode by
pulling PWRREQ low since the AP does not have programming capability
in (deep) sleep mode.

Add suspend-to-mem node to regulator core to be enabled or disabled
during system suspend and also support changing the regulator operating
mode during runtime and when the system enter sleep mode (stand by mode).

Regulators which can be turned off during system suspend:
	-LDOn	:	2, 6-8, 10-12, 14-16,
	-BUCKn	:	1-4.
Use standard regulator bindings for it ('regulator-off-in-suspend').

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 .../dts/samsung/exynos4412-odroid-common.dtsi | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
index 03943c666d11..3837e038c266 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
@@ -309,6 +309,10 @@ ldo2_reg: LDO2 {
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo3_reg: LDO3 {
@@ -338,6 +342,10 @@ ldo6_reg: LDO6 {
 				regulator-min-microvolt = <1000000>;
 				regulator-max-microvolt = <1000000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo7_reg: LDO7 {
@@ -345,18 +353,30 @@ ldo7_reg: LDO7 {
 				regulator-min-microvolt = <1000000>;
 				regulator-max-microvolt = <1000000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo8_reg: LDO8 {
 				regulator-name = "VDD10_HDMI_1.0V";
 				regulator-min-microvolt = <1000000>;
 				regulator-max-microvolt = <1000000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo10_reg: LDO10 {
 				regulator-name = "VDDQ_MIPIHSI_1.8V";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo11_reg: LDO11 {
@@ -364,6 +384,10 @@ ldo11_reg: LDO11 {
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo12_reg: LDO12 {
@@ -372,6 +396,10 @@ ldo12_reg: LDO12 {
 				regulator-max-microvolt = <3300000>;
 				regulator-always-on;
 				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo13_reg: LDO13 {
@@ -388,6 +416,10 @@ ldo14_reg: LDO14 {
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
 				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo15_reg: LDO15 {
@@ -396,6 +428,10 @@ ldo15_reg: LDO15 {
 				regulator-max-microvolt = <1000000>;
 				regulator-always-on;
 				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo16_reg: LDO16 {
@@ -404,6 +440,10 @@ ldo16_reg: LDO16 {
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
 				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo20_reg: LDO20 {
@@ -442,6 +482,10 @@ buck1_reg: BUCK1 {
 				regulator-max-microvolt = <1100000>;
 				regulator-always-on;
 				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			buck2_reg: BUCK2 {
@@ -450,6 +494,10 @@ buck2_reg: BUCK2 {
 				regulator-max-microvolt = <1350000>;
 				regulator-always-on;
 				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			buck3_reg: BUCK3 {
@@ -458,6 +506,10 @@ buck3_reg: BUCK3 {
 				regulator-max-microvolt = <1050000>;
 				regulator-always-on;
 				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			buck4_reg: BUCK4 {
@@ -465,6 +517,10 @@ buck4_reg: BUCK4 {
 				regulator-min-microvolt = <900000>;
 				regulator-max-microvolt = <1100000>;
 				regulator-microvolt-offset = <50000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			buck5_reg: BUCK5 {
-- 
2.49.0

