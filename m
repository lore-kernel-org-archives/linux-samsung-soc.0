Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CF7253948;
	Fri, 25 Apr 2025 13:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745587701; cv=none; b=czzbQkWzOQonMimYFyhmjk5OrMbM6ravkgIOsalCwoxULfpNbllaeFfVHAhXQDcRSPogUTfpQUELq3ifMRdAmBpCM1OONBM0GKedSd3JQrRbeYjEKnalBUy0U1C70XtvMovnROyRH7I1ytaKQAf3z6G+wb/hN2u0L5CILHQ538o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745587701; c=relaxed/simple;
	bh=KvrgauVidU4RGG98Ulz91lEQuU2FdGkfwGVM8Th74bE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tJWTdzzSG7H4XcWntIYx0fyxA2SbOKUHhwclKaOqdugFK5m9n2p7nkFkEW88qCsbXhU6PHd09/RPj/zILNgui7/yfHtOBhV5tRjCVj+0oG+HibsVtiG2OTqG+vSKXuo5yxDGoiqY5PQTpcKwJ28EwCN5Lr2Wzz+F3jh0S8aYDu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWNJgQ5T; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWNJgQ5T"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-309f3bf23b8so1784865a91.3;
        Fri, 25 Apr 2025 06:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745587699; x=1746192499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BStf2B2YQIkpsSwlraZoA+xWmc7cTuqT4BqqOX+71k=;
        b=VWNJgQ5TpCtG/ij/UpYTVb286ESpEGeMBd6fsvnlgvcK2EtJ9LVG5hWpQEUnd8/++b
         AYwfmjZHBPL09BND0kUB66nV1I9Z5zgkNyB7jrk850GI86xQKuBz26mStPXuZrywbdhf
         qkcx5GxmYG5XWwPQyy1eFFY0jHTru+opQocKvGs7Awy7WcBi7KguS9TTw8qM8Rk+65Bm
         nehCOMcx+ib10xVy2S6r21nYS4MG2tv19o5ZgGnpm4DyHxlnLytVObERUI5MoZB+oqKF
         n0sqsQvPkzZD2TPSfumVdDNqfrA5tN/8vP0fqCBlMBk00zscqVLMn1VRcoQlbtjJ3FRU
         TMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587699; x=1746192499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5BStf2B2YQIkpsSwlraZoA+xWmc7cTuqT4BqqOX+71k=;
        b=moWGYHDnstoOZkvrv3PUtcfA7Sk2M9RoH4iZ8Uq5PRe180P58qVj7anicmL/SLfy7Y
         iPXL8bamPgeVpDnO1nsQ8BZo6R4ySuXApFIKCwBIGX4UdsfvHTpIzri37HW/YE/j07Gj
         B1d6l5Yx2TptSDBKoIZMFNo4AwBlFNdr5dEPBQiuttIa1zGCJcKIDI+ykh5Bz9+bXkjD
         2bVgfVEZEfhLx3atXF2lDcmXaAl+sD6FrMsd7L/BSLddtQOd6OQa43OIiS4fjCK3xJRT
         JcOXY8WcXr2vk3UfoCZQhDnHBymZl0CJmBUcUR0rmNaQ1HUZcrRybmM5WG1bZOJ/Qdro
         fkUw==
X-Forwarded-Encrypted: i=1; AJvYcCUoLAkPntjt/W2xeV0552VhzHsI7UfM6jIjOBJRoFJgIClPL0HnePOHShVnIB1bNB7RIWdOZl+kLdFiBROH@vger.kernel.org, AJvYcCVxxtWOHy60cecKU4d80xSoJ93TBpB+SF9rUw7VuKRkfnc75h0jXkhMoryWXPERHRyZL60CEBTyCr5B@vger.kernel.org, AJvYcCWFNfCVLlWX1wuHXqLqDvOb45Z7EgksAFfCPMRAeipytMeaHtn2UJqcVZTZALDl9gH5hW+zByf/7J08@vger.kernel.org, AJvYcCWyIjkmqhcUuGU9GNZRiiR4hQRsBuh0UyvsLDlcbsF0A2gmIrxrGkz3JDSAVRZXVTiNvzqpQ5G3brzQ52Y7Ik5dsJY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxU6LH+YXiirLK83TRCkTbsRBr+eDogvUru/GPO/Mef7E46oqIF
	YQuLeP9S0o4BtpRU5pWW812Bb9UNvoku5McUTehDn148w6t0CG7X
X-Gm-Gg: ASbGnctRPjCaxLqqBSpMr3EG4BVGDWaAHpcZWbfeZ3qjANmc9S9wPY13Xr7Aw3EO8Ky
	sml8zXSFlDWAOdv2mpUX6uFQu9OIGenDv21qXT/klyUPgpdLa64meVxlUuA/fB9lqiITd1IKeDm
	FJ0MfAqotBYRovp1Qdt3V2fhDp6AEIvhIXFgZHasV0+TtFlDwWDojloZJHNwt8ae07Vxu9pzrpH
	X5Z3yq3XLAeEpgdKHjtzWNQ7kcWyNaa+EbKLxvWM8nNQa5Lu+nJxnR8dLhyypf2ProP2YggFB58
	VJgAvu28nNp1BDToqMY+m3b6o2sDXtE4wUqlyjzOj53Q1VaCNWHbmw==
X-Google-Smtp-Source: AGHT+IHNbZ4dO+ZOM7YR+TEwVLncwixry2Elrer6mAYvyb7wsMkO+wjPEKzwaZPQab15oKKKnw+caw==
X-Received: by 2002:a17:90b:3d45:b0:309:f53c:b0a0 with SMTP id 98e67ed59e1d1-309f7e6e981mr3907957a91.24.1745587698929;
        Fri, 25 Apr 2025 06:28:18 -0700 (PDT)
Received: from localhost.localdomain ([110.44.101.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f7752a03sm1564313a91.18.2025.04.25.06.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:28:18 -0700 (PDT)
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
Subject: [PATCH v1 04/10] ARM: dts: exynos: Add rtc clock definitions for MAX77686 PMIC for Exynos4412 Midas
Date: Fri, 25 Apr 2025 18:56:24 +0530
Message-ID: <20250425132727.5160-5-linux.amoon@gmail.com>
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
 arch/arm/boot/dts/samsung/exynos4412-midas.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi b/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
index 3d5aace668dc..ad2c7ebfdc41 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
@@ -729,6 +729,13 @@ max77686: pmic@9 {
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
 				regulator-name = "VALIVE_1.0V_AP";
-- 
2.49.0

