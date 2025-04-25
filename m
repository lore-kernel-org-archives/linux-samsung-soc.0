Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13886253348;
	Fri, 25 Apr 2025 13:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745587747; cv=none; b=XVcrsau34U+XeotvJ3CseCysv+us209CvpNP6xg3+F82UvRbuot9X+4gUwYIkk8NmtGF9ZlHXW9CbbwYV3b20f5uREoq3MwxlBsJUt2GJVntU+u4+GQEz3eQyxYIDL6b4mfRzNgs4ivN9vg7YcEs/imqZm4Vv52HQL9wBKwKV+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745587747; c=relaxed/simple;
	bh=Jaaf+rjm1bZ1ECTiGOjtYoPwfUoYXVyS0XoUU5fbgNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vz0Fo63G/l9ox6Eo13X+VyMgxQQobwgVKSGgoktZ5NkeRXnlrRd1Kct/Yo2G/u11vgq5euFDIoHz6OuJs4aUivBxHMEg0mLtB2AtXjZ+ZNmMw3sLn1juciGXBLH6Z+tTkhsxpZ/fFVaU1/96svjtNqXhQPe2rX5DAFUh50T0a8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P0Klec2T; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0Klec2T"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3012a0c8496so1753402a91.2;
        Fri, 25 Apr 2025 06:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745587744; x=1746192544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BU6Gjz5o2n3GUta3AJxmLr4JZHkWrS1NhJGZu0/+08=;
        b=P0Klec2T7z8G5rkwSQHFRS0a+fXC6Rm+7eywv7WXiXjRvq24P4oYyYLohnrylMuKF/
         jlTJdML2NMXJTL3xZ7dytSerM1nLWfDKgOOmyxnLztNk58pK5VzxOVUOuDbPO4v+Uchu
         JwNWTUkF+h5IEBg9i5TRbFzZqsoDg0HUHkf0NEltX6o/GM5DwEmgmG0o9VOOBZu8tuEE
         qN8t7RQ0sdtPLRH05oOuA22NSkgOBJX+hz4be5MHrJKZi7tiQw87oxSxLjPBFjzglBHd
         YoEIUaMIqn+yVMV2wgbhXVUKoyGi85YGO4PqjA4ZYawe4FKeZQ0A+7wUcU0Epds1Lodj
         /nlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587744; x=1746192544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5BU6Gjz5o2n3GUta3AJxmLr4JZHkWrS1NhJGZu0/+08=;
        b=nwuGo7lGOixpt5jVJD0U18Ft3LsMTnGpGGzX0ZphlP0uA37pVxlZy3yPc7NigiU9fv
         AuC1SNoM5KyOswCfjWhr/jddus7jn0mvRpDJY1I3kPMHT3ZT6l9Ypj6IdTZ4Tz5867Up
         7TjqNhIV6x4jg9NQ6rs7/sJ5ycwKrVgdr7E95xHl7eMJD0qtIOPexBN9TVnT3sJCZlrH
         0h0sK86nnpnW5PtWFuNfhT13W7xOb1R9B07f8G91rEwdAY8VVEuwqMkraeQsyReX2SCe
         P2/nJMlC7Mz9FY2AAOdtLZsH3dxhsCd/x+eGhhu0Qn94FBuB6kGwmUCx5wLREgU8raaB
         CVGA==
X-Forwarded-Encrypted: i=1; AJvYcCUkrG6i3Z8YKREBQGOmTCTYJCjnqwcG8LmtneGAaTHSBR0yCnr24Xo75bPvD6LlYW313ZX7bMDqvRWEVTfwlS3s7Ys=@vger.kernel.org, AJvYcCWJJChHkH3HcdEZx4RJAuUMgi/LsJKgPZAmzfTKbtMVxGeF8qhty4h7l6FIQAiVf/EXIDO2Pj1TcxyeTexe@vger.kernel.org, AJvYcCWNytjpUgoXeit6YeXOdPhuJuGxXbSZD3zlXRxpz3MY/AIImBGfjulJpnixnazQvxQFFZIGEPWFJHD6@vger.kernel.org, AJvYcCWRpZwYZFS7JsWGE0VHJaU8Ldx73AdqQ21hop06WVPXjuMJfcLwQkUYkxe5wUv3NBhNV8i03Gm1AROx@vger.kernel.org
X-Gm-Message-State: AOJu0YwNAaKLWbNVzRDGx3dpsWC27i6VF0FAkmqUpgYx1rQsarIRRU3n
	FhlFAvFG7XS2wrbhSdHSp7LiRlsXmsRN21kmNt5imOk+wMqr2FfYkFiGqA==
X-Gm-Gg: ASbGncsWLHym4zaWInO9kmVaE6ZfTNILhAB+9b8ng8LOOxZe/Rg7eCfHuI5DvB69mZ2
	4jDlrSTD4tpCvazu2n8QK+KugSxmCzrHPMazdtCHfrV+65mMzBUwnn+rJTmMoE+80Jf78kxADLE
	EChCzc08qW6uvR0XYWwld2Q3YwPtD24CzlzvlkSSYyt7iiS+MhZC0YdptJ8BL+MgStTKsuGqRPB
	kNdv3gs6+K+C2UuzvlD7OsLH16Thp3dYYvkJGDc0m6xVLJc1anRJposf549iBVz2MSfM8dzXn/v
	Xeyw1ZhithDsEKEeVbOXUzRMWXtd7IiOuUhLOTILi+K3WpdS3zzNjg==
X-Google-Smtp-Source: AGHT+IE/Flas7YxNWdzmEA4xipdCbt62Jh1HqONiQvnCT3cgbZMRmzKQAq8RQ8r26ji5bsvaT+3wuw==
X-Received: by 2002:a17:90b:1b48:b0:308:539d:7577 with SMTP id 98e67ed59e1d1-309f7c70113mr5039718a91.0.1745587743976;
        Fri, 25 Apr 2025 06:29:03 -0700 (PDT)
Received: from localhost.localdomain ([110.44.101.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f7752a03sm1564313a91.18.2025.04.25.06.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:29:03 -0700 (PDT)
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
Subject: [PATCH v1 09/10] ARM: dts: exynos: Add rtc clock definitions for MAX77686 PMIC for Exynos5250 snow
Date: Fri, 25 Apr 2025 18:56:29 +0530
Message-ID: <20250425132727.5160-10-linux.amoon@gmail.com>
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
 arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi b/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi
index 65b000df176e..ca6ebd8a9d62 100644
--- a/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi
@@ -298,6 +298,13 @@ max77686: pmic@9 {
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
 				regulator-name = "P1.0V_LDO_OUT1";
-- 
2.49.0

