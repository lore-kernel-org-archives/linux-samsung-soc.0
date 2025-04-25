Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE309253958;
	Fri, 25 Apr 2025 13:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745587710; cv=none; b=ofPFDD5dOuzhOUR9RqcbuCY0DuuIxhi8qC2vZ333eP4uL5/HxKvfJoPWozFABP/UTxzvqSq9vdGmBJ9fbXUCK7Evp/ayBXmYYhiga+yxOvC5L9JwNxJ/vaD0eaJjZcOTCOTV5RkqGxZt2iX8gkSalW7EHM+1v0EfrSWWMkXnhXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745587710; c=relaxed/simple;
	bh=0e1fyakf++i6VdcFvpEfBDLtd09wqXUqu5yV4Wrph4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ky73mZXZdsxW20t3tVjYEMPWVkOIzdCiDlGPRwjaaPtSnYVI8xOMK0wFmvdj1bxfHjqluTJLjaW8PdiMU76i7cEJN/deHzUqybEF3Y11+h0PmxHWJadhtgXjfkNZoQGnQxz1V1nYb+szOThNgHz0OCCftZ+emKk6NmMTdJiiwbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hcKLuPpc; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcKLuPpc"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-301e05b90caso2334818a91.2;
        Fri, 25 Apr 2025 06:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745587708; x=1746192508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l94fvJs4daZVvI5xF47uHe2QvDzbrKRGqVtD3TI8CH4=;
        b=hcKLuPpcQLSq1+/c4rcIz6R+JDl+lmAYAL6B0QoKe606W44AOFBYUD+TFgks5DAg0j
         rvRSQqGn8BDOU6aWQSI9Wj4t5MDyudoU92GWb5Aw62Pj5CjbN/+TUzMyN/0pxS5h/wUG
         HOd1V5FcGvkKdAQ/BKOlqhpIWT7wpaLxD2mna/1ypb6DuIq31g3vh2JnY1QFdUSMj1sj
         wFcz/mZjYzFETFa27wlHpPPfWn/2QkPxYYOWWrruI0KvUSft320PXnhDf86KDC7hxbDo
         Y/HQpUYdamPZ8rrnQG1ANuqgtukpJkp7TOSG7OZwhHHVl2QctbzuanY5koCWX8mwrU6A
         I08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587708; x=1746192508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l94fvJs4daZVvI5xF47uHe2QvDzbrKRGqVtD3TI8CH4=;
        b=on+RHxo4T5DQ1m46dEayyXjkpAgUOkoKvb0TMxBtW6XofJINAKHQqYdBGaQ5T0svgJ
         1YSohY0upL0+yo8f60qzeAZdQ4/hnzJfjpz36/Nf9dwCXATzUNcPn9ZAmr+OI6RU0w4u
         kzoFFSCes3+Vzh8NU1hRnmlIEIyvh8jp3i9navGapjVKnku/vME8cfFJJsWyAKfrSKJ+
         x9yNJTUfSlL9zx+xa9mxRYgtTJcfGT/Sp7cP8s53doBp3IIG8yAUWZR0hNckZRps6jwg
         ZvzC0Sr4DEWTFK8nKJZOV8D2J9ZnRmL1xBlyzY0WpUcOmj5jtvSTqo22FSHbO8ggILer
         bJ4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvurxjBxw/LXBSUft1QbmfwESz34B3l/TmsrtJoJQXYG/mEIDLiO8FmCQ1mGQ3c8MK6bD1OwO2sGSikmxcYGF2DGI=@vger.kernel.org, AJvYcCWKcucqlxjg9mbHYrQpBdSn/GeoHGUwKjiEzbyicX8Exvc5AMTL0c8TbKIKMX3dG0UUQnSxBSHmlHPu@vger.kernel.org, AJvYcCXK6FcAettvXEb67uhxF1ZOF93a06NTobmTlcY90S2nHzl0XqfLvkiXoi3lRF1OwYuZ8xraT+5R7OxPhwWU@vger.kernel.org, AJvYcCXNqYqgwUaNUOS6E7Ztp1HRDOW+CY8G15DZC6yXP2zsQ/s9ePVMZZjvmFRY7uLgh4XxiX7bs6axdr7l@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/viEU8EHTEwkp4QaqhJtHDA4B4hCRKJV/gv61QztP3TL7xShN
	7KfYOuxXwge3CSmp0fxuaIg22vrEY07ihBtyHQQa54DOXMybQ/h7
X-Gm-Gg: ASbGncvzpXzv1iZtm6gvPR2C7f2NgI01FF4xwAUnGYqhnw7ALp2Wm6pzfwQu7ONc5Ew
	NvQuRT/vMLv9q6Rx0YodNRQdXf/weIwqN8KUjQh68LbGQuD2JanaYRPVhAjSSOfgYrCbUhizKDg
	BsLxiPoyXCj6CSCANzALzJR8EGW4Bxm58qI7XnUWF4pVPs8Mvc1ZuRmBCbsNKW3+gxY2Vm/WVaD
	LFqViGOhPGyudkMPM0uWdn/LWtuixUqpud1eB/DUDYE4SkuP3IjSQyT5/bCw2DUR3BgOWLoK+iP
	GDZXH9jOaAKqyPOsP1T6/Lpiwf4BF0NQLlbxr1DLaOBIMVqa6XyYWA==
X-Google-Smtp-Source: AGHT+IHZk//aX1Nythqxr2CigBoZw9Zr8jeiTQwIrF2Sb5trevqSTK8qfuMg1eiI7z5y82nmYsHj7w==
X-Received: by 2002:a17:90b:2705:b0:2ee:8ea0:6b9c with SMTP id 98e67ed59e1d1-309f7de019bmr4539523a91.12.1745587707978;
        Fri, 25 Apr 2025 06:28:27 -0700 (PDT)
Received: from localhost.localdomain ([110.44.101.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f7752a03sm1564313a91.18.2025.04.25.06.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:28:27 -0700 (PDT)
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
Subject: [PATCH v1 05/10] ARM: dts: exynos: Add rtc clock definitions for MAX77686 PMIC for Exynos4412 p4note
Date: Fri, 25 Apr 2025 18:56:25 +0530
Message-ID: <20250425132727.5160-6-linux.amoon@gmail.com>
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

The MAX77686A includes a crystal driver with an external load capacitance.
When enabled, the crystal driver starts in low power mode. The
LowJitterMode bit controls the crystal driver, allowing it to switch
between low power mode and low jitter mode (high power mode).
Setting the LowJitterMode bit to 1 activates low jitter mode on
three channels simultaneously. These three 32khz buffer outputs
(32KHAP, 32KHCP, P32KH) are independently enabled/disabled over I2C.

The 32khz_ap output is typically routed to the AP Processor, while the
32khz_cp and 32khz_pmic outputs are intended for BT, WLAN, BB,
or peripheral chipsets.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
index 28a605802733..ad0abe8d9e30 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
@@ -432,6 +432,13 @@ max77686: pmic@9 {
 		reg = <0x09>;
 		#clock-cells = <1>;
 
+		max77686_osc: clocks {
+			compatible = "max77686-rtc";
+			#clock-cells = <1>;
+			clock-output-names = "32khz_ap",
+				"32khz_cp", "32khz_pmic";
+		};
+
 		voltage-regulators {
 			ldo1_reg: LDO1 {
 				regulator-name = "ldo1";
-- 
2.49.0

